# First-run setup

Runs when no travel profile exists, or when the traveler says "set up / update / re-learn my travel profile". Target: about 5 minutes of the traveler's time. Tell them what's happening at each step in one short line.

## Step 1. Check the browser (P1)

The portal steps need one of:
- **Claude in Chrome** (the browser extension): can fill forms **and** upload the attachment PDF. The traveler must be signed in to myportal in that Chrome.
- **The Claude desktop app's built-in browser pane**: can fill every form field but **cannot upload files**. The traveler attaches the PDF themselves (five clicks; P7).

Check which is connected and record it as the profile's browser. If neither, say so plainly: setup questions (Step 2) can still be done now; the Maps measurement and the history step (Step 4) wait until a browser is connected.

## Step 2. Ask the profile questions in one round

Ask all of these together (AskUserQuestion for the multiple-choice ones, plain text for the rest):

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

1. Open **Travel Authorizations → View** (or *Find an Existing Value* with a blank ID, then Search), and list the traveler's TAs with ID, description, dates and status.
2. Open the **2 most recent TAs that reached Approved** (prefer Approved/Paid over Pending or Sent Back). Then do the same under **Expense Reports → View** for the 2 most recent ERs.
3. For each one, read the header and every line with one script per page (P3 helper `G()`):

```js
const d = G();
const rows = [...d.querySelectorAll('[id*="$"]')]
  .filter(e => /\$\d+$/.test(e.id) && !/^IC|^#/.test(e.id))
  .map(e => ({ id: e.id, v: (e.value ?? e.textContent ?? '').trim() }))
  .filter(x => x.v);
const hdr = [...d.querySelectorAll('input,select,span')]
  .filter(e => e.id && !/\$\d+$/.test(e.id) && /DESCR|BUSINESS|PURPOSE|LOCATION|FROM_DT|TO_DT|STATUS|SHEET_ID|TRAVEL_AUTH/i.test(e.id))
  .map(e => ({ id: e.id, v: (e.value ?? e.textContent ?? '').trim() }))
  .filter(x => x.v);
JSON.stringify({ hdr, rows }).slice(0, 15000);
```
   Click **Expand All** first if line details are collapsed. Read chartfields only from what Expand All shows on the lines; never use Actions → GO to open the accounting view. If they aren't visible, ask the traveler.
4. Look in each one's comments/history for **Sent Back for Revision** reasons.

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
1. **Claude memory available** (memory tools present): the traveler's yes in Step 5 is their request to save. Write `/areas/sdccd-travel-profile.md` in the `profile-template.md` format. Read the file first if it exists, and update it rather than overwrite.
2. **Claude Docs available:** create a doc titled `My SDCCD Travel Profile`.
3. **Neither:** give them the profile as a text block starting `SDCCD TRAVEL PROFILE` and tell them to paste it at the start of future travel chats (or into their Claude project instructions).

Confirm in one line where it was saved and how to change it ("say 'update my travel profile' anytime"). Then continue with what they originally asked, if anything.
