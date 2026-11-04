# Portal playbook (P1–P10)

Everything below was verified on real runs in Sep–Oct 2026. Follow it rather than rediscovering it. If the portal has changed, note what changed and tell the maintainer (see README).

## P1. Before touching the portal — check the browsers
- **Which browser, and what it can do** (fill forms, upload files, run scripts in the page) is in `platform.md`. Check it first and tell the traveler up front which browser you'll use and whether attaching the PDF will be their step.
- **Sign-in is always the traveler's.** Never type a password. If a tab lands on `login.microsoftonline.com`, open the portal home (`https://myportal.sdccd.edu/psp/IHPRD/EMPLOYEE/ERP/h/?tab=DEFAULT`), bring the browser to the front, and ask the traveler to sign in and reply "done".
- **Site approvals.** The browser may ask approval for `myportal.sdccd.edu`, `fsprd.sdccd.edu`, `google.com`; wait for the traveler, and batch work into few steps.
- **No script access in the page?** The ids below still identify fields and buttons. Click and type by the visible labels instead; the form sits inside a frame, and each change takes ~5 s to round-trip to the server, so wait before the next field.
- Sessions time out after 60 min of inactivity; a "Your session is about to expire" banner has an **OK** button — click it.
- Keep the portal in **its own tab**. Do Maps, email and drive work in another tab.

## P2. Getting to the form (direct component URLs are blocked)
URLs like `…/c/ADMINISTER_EXPENSE_FUNCTIONS.TE_TRAVEL_AUTH.GBL` return **"Employee-facing registry content"** — don't use them. Reliable path, all by JS text-match click:
1. Landing page → click the element whose text is exactly **`Finance Dashboard`**.
2. Left sidebar → **`Travel & Expense`** (expands) → **`Travel Authorization`** or **`Expense Report`**.
3. You land on *Find an Existing Value / Add a New Value*. For a new one click `PTS_CFG_CL_WRK_PTS_ADD_BTN`. To find an existing one click `PTS_CFG_CL_WRK_PTS_PAGE_TOGGLE`, set the ID field (ER: `EX_HDR_SRCH_VW_SHEET_ID`), then click **Search** with a real coordinate click (a JS click on `PTS_CFG_CL_WRK_PTS_CFGASRCHSB_GB` did not run the search).
The NavBar compass is hidden at the pane's narrow width — don't rely on it.

## P3. Driving the form
The form lives in a same-origin iframe (`main_target_win0`, sometimes `ptifrmtgtframe`). `read_page`/`find`/`form_input` can't see inside it, and typed keystrokes pick the wrong `<select>` option. Use `javascript_tool`:

```js
const G = () => { for (const f of document.querySelectorAll('iframe')) {
  try { const d = f.contentDocument; if (d && d.getElementById('ICSID')) return d; } catch(e){} } };
const W = ms => new Promise(r => setTimeout(r, ms));
const setV = async (id, v, wait = 5000) => { const e = G().getElementById(id); if (!e) return id + ' MISSING';
  e.focus(); e.value = v; e.dispatchEvent(new Event('input', {bubbles:true}));
  e.dispatchEvent(new Event('change', {bubbles:true})); await W(wait); return 'ok'; };
const setPay = async (n, code = 'EMP') => { const s = G().getElementById('PAYMENT_TYPE$' + n);
  s.selectedIndex = [...s.options].findIndex(o => o.value === code);
  s.dispatchEvent(new Event('change', {bubbles:true})); await W(4500); };
```

- Every `change` is a server round trip — wait ~5 s. Keep each call under ~40 s (≈ one new line per call). Re-list all lines after each call.
- **Payment Type:** set it with `setPay` (selectedIndex). Assigning `.value` sometimes reverts to blank after the next round trip. Re-check after entering Miles.
- **Mileage amount** shows `0.00` until the *next* round trip — verify it on the following call, not the same one.
- **Order per new line:** date → expense type → description → payment → miles/amount.

## P4. Line buttons and dialogs (ids differ between TA and ER)
| | TA | ER |
|---|---|---|
| Insert after row N | `EX_TA_LINE_WRK_EX_INSERT_LNPB$N` | `EX_LINE_WRK_EX_INSERT_LNPB$N` |
| Delete row N | `EX_TA_LINE_WRK_EX_DELETE_LNPB$N` | `EX_LINE_WRK_EX_DELETE_LNPB$N` |
| Save | `TA_TOOLBAR#SAVE` | `ER_TOOLBAR#SAVE` |
| Attachments | `EX_TA_HDR_WRK_ATTACHMENTS_PB` | `EX_HDR_WRK_ATTACHMENTS_PB` |
| Actions dropdown + GO | `EX_ICLIENT_WRK_GOTO_DROPDOWN_TA` + `EX_ICLIENT_WRK_GO_PB` | same |

- **Delete confirmation** ("Delete Confirmation … press OK") renders as a modal over the page that JS can't reach. Take a screenshot and click its **OK** button by coordinate. Delete the **highest row number first** so lower indexes don't shift.
- **Error/message boxes** (e.g. *"Cannot change an expense type if came from Travel Authorization. (10502,644)"*) appear in the top document with a visible **OK** (`#ICOK`): find the visible button whose text is `OK` and click it.
- **Expand All** (link text) renders every line's detail fields; required-field errors (red flag, red input) only show when a line is expanded.

## P5. Default Location (drives every per-diem amount)
Typing a ZIP into `EX_LOCATION_VW2_DESCR` does **not** resolve it. Use the lookup:
1. Click `EX_LOCATION_VW2_DESCR$prompt` → modal `ptModFrame_0`.
2. In the modal set `#ICKeySelect` = `1` (search by **Expense Location**, not Description), set `EX_LOCATION_VW_TXN_LOCATION` = the venue ZIP, click `#ICSearch`.
3. Click `SEARCH_RESULT1` (e.g. 92501 → RIVERSIDE). The header then shows the city.

## P6. Chartfields (from the traveler's profile)
Use the profile's Fund / Dept / Product. Actions dropdown → `A` (Default Accounting) → GO. The split fields appear inline: `EX_TAUTH_SPLIT_FUND_CODE$0`, `EX_TAUTH_SPLIT_DEPTID$0`, `EX_TAUTH_SPLIT_PRODUCT$0` → then `EX_ICLIENT_WRK_OK_LEVEL1_PB`. A save error *"Department selected on line 1 … is not a valid department"* means this was skipped. An ER populated from a TA inherits them.

## P7. Attaching files (Chrome only)
Click Attachments → **Add Attachment**. The file input sits in a nested `ptModFrame_*` the extension can't index. Adopt it into the top document, upload, move it back, submit the modal:

```js
// 1. adopt
const frs = [...document.querySelectorAll('iframe')].map(f=>f.id).filter(i=>/ptModFrame/.test(i));
const mf = document.getElementById(frs[frs.length-1]); const idoc = mf.contentDocument;
const inp = idoc.querySelector('input[type=file]'); window.__frid = mf.id; window.__inp = inp;
const ph = idoc.createElement('span'); ph.id = '__phmark'; inp.parentNode.insertBefore(ph, inp);
const holder = document.createElement('div'); holder.id = 'claudeUploadHolder';
holder.style.cssText = 'position:fixed;left:20px;top:20px;z-index:2147483647;background:#fff;padding:8px';
document.body.appendChild(holder); holder.appendChild(document.adoptNode(inp));
inp.id = 'claudeFileInput'; inp.setAttribute('aria-label','Claude file picker');
```
Then `find` "Claude file picker" → `file_upload` with the PDF's path in the session outputs folder → then:
```js
// 2. restore + submit (clicking "Upload" does NOT work)
const mf = document.getElementById(window.__frid), idoc = mf.contentDocument, w = mf.contentWindow;
const inp = window.__inp; inp.removeAttribute('id'); inp.removeAttribute('aria-label');
const ph = idoc.getElementById('__phmark'); ph.parentNode.insertBefore(idoc.adoptNode(inp), ph); ph.remove();
document.getElementById('claudeUploadHolder').remove();
w.doModalMFormSubmit_win0(idoc.querySelector('form'), '#ICOK');
```
Fill `ATTACH_DESCR$N`, OK, save. Verify the header reads `Attachments (n)`.
**If your browser can't upload files:** give the traveler the PDF as a download and give them the five clicks: Attachments → Add Attachment → choose file → Upload → description → OK → Save for Later.

## P8. Google Maps mileage (the proxy blocks Nominatim/OSRM)
Open `https://www.google.com/maps/dir/<origin>/<destination>` in a non-portal tab, `get_page_text`, and take the **fewest-miles** route listed (not necessarily the fastest). A "restricted usage or private roads" note usually refers to a gated street near home; ignore it unless the route changes. For the map image use Chrome `computer screenshot` with `save_to_disk: true` (the file lands in the container); the pane's screenshots are also saved to `tool-results/`. Re-measure every trip — routes drift by a mile or two within a month.

## P9. Reading shared files
The Google Drive connector lacks read scope for files shared by link. Open the Drive link in Chrome, read it with `get_page_text`, and capture pages with `computer zoom` + `save_to_disk`. Downloading the original needs the traveler's OK first.

## P10. Submitting
Never submit. Stop at **Pending** and hand over: submitting certifies the expenses as the traveler's own, so the traveler clicks **Summary and Submit**, ticks the certification box, and clicks **Submit** themselves. Before handing over, show the final line table, the total and the attachment count. A TA dated in the past, or an ER more than 10 days after the event, asks for a short reason; draft one for the traveler to paste (e.g. "Same-day regional convening confirmed on short notice").
