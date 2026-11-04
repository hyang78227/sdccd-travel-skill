# First-run setup

Runs when no travel profile exists, or when the traveler says "set up / update / re-learn my travel profile". Target: about 5 minutes of the traveler's time. Tell them what's happening at each step in one short line.

## Step 1. Check the browser (P1)

The portal steps need one of:
- **Claude in Chrome** (the browser extension): can fill forms **and** upload the attachment PDF. The traveler must be signed in to myportal in that Chrome.
- **The Claude desktop app's built-in browser pane**: can fill every form field but **cannot upload files**. The traveler attaches the PDF themselves (five clicks; P7).

Check which is connected and record it as the profile's browser. If neither, say so plainly: setup questions (Step 2) can still be done now; the Maps measurement and the history step (Step 4) wait until a browser is connected.

## Step 2. Ask the profile questions in one round

Ask all of these together (a multiple-choice question tool for the multiple-choice ones if you have one, plain text for the rest):

1. Full name and job title
2. Department / division
3. Home address (street, city, ZIP). Explain why: mileage is measured from home or the regular work location, whichever the method uses.
4. Regular work location (District Office, a campus, or another site, with address)
5. Chartfield for travel: Fund · Dept · Product. Say: "If you don't know it, I can read it from your past TAs in Step 4."
6. Department admin(s) who handle travel, and your FBS contact
7. Email address to search for registration confirmations and receipts (only if an email connector is available)
8. Default business purpose (default `PRDEV` Professional Development)

Anything they don't know, leave blank for Step 4 to fill.

Then, once a browser is available, measure home → regular work location in Google Maps (P8, fewest-miles route) and record it. Also ask: "Have you moved since your recent trips?" (needed to read Step 4 correctly).

## Step 3. Sign in, then you navigate

1. Open the portal start page in its own tab (P1). If it lands on a Microsoft sign-in page, ask the traveler to sign in, and wait for "done".
2. Navigate yourself (P2): Finance Dashboard → Travel & Expense → Travel and Expense Center.

## Step 4. Learn from history (READ-ONLY)

**Read only. Never click Save, Submit, Delete, Insert, Update, Copy, or any Actions/GO menu item. Never change a field value.** If a page opens in edit mode (for example a Pending TA), read it and leave without changing anything. If a "save changes?" prompt appears, choose the option that discards/doesn't save.

Use the **View** (inquiry) pages, never Create/Modify: they are read-only by design. Verified path (Nov 2026), all by JS text-match click:

1. Finance Dashboard → sidebar **Travel and Expense Center**. The center's content is in iframe `main_target_win0` (no `ICSID`).
2. **TAs:** under "Travel Authorizations" click **3 More...** → **View** (component `TE_TAUTH_INQ`). **ERs:** under "Expense Reports" click **2 More...** → **View** (`TE_EXP_SHEET_INQ`). To switch from TAs to ERs, go back to the Finance Dashboard and repeat from step 1.
3. On the search page leave every field blank and run `G().getElementById('PTS_CFG_CL_WRK_PTS_SRCH_BTN').click()` (a JS click works on this button). Results list ID, description, status and creation date, newest first.
4. Pick the **2 most recent TAs with status Approved or Closed**, and the **2 most recent ERs with status Paid** (skip In Process, Pending, Denied).
5. Open a result: the ID text is a `<span>`; click its nearest `[onclick]` ancestor. Move between results with `G().getElementById('#ICNextInList').click()` (`#ICPrevInList`, `#ICList` = back to results).
6. **TA view** opens on the lines; click **Expand All**. **ER view** opens on a summary page with the **Approval History** (shows any "Sent Back For Revision"); read it, then click `ER_TOOLBAR#DETAILS` for the lines and **Expand All**.
7. Read the lines with this script (same field ids on TA and ER):

```js
const d = G();
const F = ['TRANS_DATE','EXPENSE_TYPE','DESCR','PAYMENT_TYPE','TRANS_AMT1','MILES'];
const lines = [];
for (let n = 0; n < 60; n++) {
  if (!d.getElementById('EXPENSE_TYPE$' + n)) break;
  const o = {};
  for (const f of F) { const e = d.getElementById(f + '$' + n); o[f] = e ? (e.value ?? e.textContent).trim() : ''; }
  lines.push(o);
}
const hdr = d.body.innerText.replace(/\s+/g, ' ').match(/(Authorization ID|Report \d{10}).{0,300}/)?.[0];
({ hdr, lines });
```
   Chartfields are **not shown** on the view pages. Don't go looking for them in Create/Modify or via Actions → GO; ask the traveler (Step 2 already did).
8. Send-back **reasons** are usually not in the Approval History comments column. If a report was sent back, note that it was and ask the traveler what the reviewer asked for.

Extract:

| Convention | How to infer it |
|---|---|
| Chartfield | the Fund / Dept / Product on the lines or accounting split |
| Business purpose | the header's business purpose |
| Regular work location | the work location they compared against, if a mileage description names it |
| mileage_method | compare claimed miles to today's Maps miles for home → venue and work → venue: ≈ the smaller one → `lesser-of`; ≈ home miles minus the commute → `deduct-commute`; unclear, or the traveler has moved since → ask |
| default_maps | which maps their attachments named (only if attachment titles show it) |
| meal_lines | per-meal lines vs one DINNER-type line per day between first and last day |
| description_style | copy one real mileage description as the example (replace the venue with `<venue>`) |
| same_day_wording | the DAYOFTR description on any same-day trip |
| attachment_label | the attachment descriptions |
| notes from send-backs | the reason text, summarized |

Do not record amounts, trip details or receipt contents in the profile, only the conventions.

If there are no past TAs/ERs, or the portal can't be reached, use the defaults in `profile-template.md` and say so.

## Step 5. Propose, confirm, flag conflicts

Show one short table: each field, the value, and where it came from ("you told me", "from your March TA", "default"). Then:
- **Flag conflicts with district rules** in a separate short list (for example: "Your past ERs attached receipts as separate files. District rule R2 requires one combined PDF, so I'll always combine them.").
- **Flag `deduct-commute` vs `lesser-of`** if their history used a method different from the default, and confirm which they want to keep. Their approvers have accepted what they've done before.

Ask: "Does this look right? Reply yes, or tell me what to change." Apply corrections. Nothing is saved until they say yes.

## Step 6. Save the profile

In order of preference:
1. **Memory available:** the traveler's yes in Step 5 is their request to save. In Claude, write `/areas/sdccd-travel-profile.md` in the `profile-template.md` format (read it first if it exists, and update rather than overwrite). In ChatGPT, save it as one memory that starts `SDCCD TRAVEL PROFILE`.
2. **A document tool available** (Claude Docs, or a connected folder): save it as `My SDCCD Travel Profile`.
3. **Neither:** give them the profile as a text block starting `SDCCD TRAVEL PROFILE` and tell them to paste it at the start of future travel chats (or into their Claude project instructions).

Confirm in one line where it was saved and how to change it ("say 'update my travel profile' anytime"). Then continue with what they originally asked, if anything.
