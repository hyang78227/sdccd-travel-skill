# SDCCD Travel skill for Claude

A Claude skill that fills out your SDCCD **Travel Authorization (TA)** before a trip and your **Expense Report (ER)** after it, in myportal (PeopleSoft). It builds the one combined attachment PDF, enters the lines, and **stops before submit** so you review and submit yourself.

The first time you use it, it sets itself up for you: it asks for your name, address, department and chartfield, then (with your OK) reads your two most recent TAs and two most recent ERs to learn how you usually file. You confirm what it learned before anything is saved.

> **Not an official SDCCD product.** Community-maintained by SDCCD staff for colleagues. Always review before you submit; district policy and FBS have the final word.
>
> **Status:** version 1.0. Built from a working personal version used on real TAs and ERs in fall 2026. Please report anything that goes wrong (see [Feedback](#feedback)).

---

## What you need

| | |
|---|---|
| **Claude account** | Any plan where you can add skills (Settings → Capabilities shows "Code execution and file creation") |
| **A browser Claude can use** | **Claude in Chrome** (the browser extension) — recommended, because it can also attach the PDF for you. Or the **Claude desktop app**, whose built-in browser can fill the forms; you'd attach the PDF yourself (five clicks). |
| **Memory turned on** (recommended) | So your travel profile is remembered between chats. Without it, Claude gives you the profile as text to paste next time. |
| **Your myportal sign-in** | You always sign in yourself. Claude never sees or types your password. |

## Install (about 3 minutes)

> **Prefer to have Claude walk you through it?** Open a new chat in Claude and send:
> *"Help me install the SDCCD travel skill from https://github.com/hyang78227/sdccd-travel-skill — follow its AGENTS.md."*

1. **Download the skill file:** [`dist/sdccd-travel.zip`](dist/sdccd-travel.zip) (click it, then the download button). Don't unzip it.
2. **Turn on code execution:** in Claude, go to **Settings → Capabilities** and turn on **Code execution and file creation**. While you're there, check that **memory** is on.
3. **Upload it:** go to **Customize → Skills**, click **+**, choose **Create skill → Upload a skill**, and pick `sdccd-travel.zip`. Make sure its toggle is **on**.
4. **Connect a browser:** install **Claude in Chrome** from the Chrome Web Store and sign in with the same Claude account, *or* use the **Claude desktop app**.
5. **Run setup:** start a new chat and say **"Set up my SDCCD travel profile."**

> Already have your own SDCCD TA or ER skills from before? Turn those off in Customize → Skills so Claude doesn't mix them up with this one.

### Claude Code users
```text
/plugin marketplace add hyang78227/sdccd-travel-skill
/plugin install sdccd-travel@sdccd-travel-skills
```
Turn on auto-update for the marketplace in `/plugin` → Marketplaces to get new versions automatically.

## First-time setup: what to expect

1. **Questions, once:** name, title, department, home address, regular work location, chartfield (Fund · Dept · Product), your department's travel admin(s) and FBS contact, business purpose. If you don't know your chartfield, say so; Claude can read it from your past TAs.
2. **Sign in:** Claude opens myportal; you sign in. Claude then navigates by itself.
3. **Learning from your history (read-only):** Claude opens your 2 most recent TAs and 2 most recent ERs and notes your habits: chartfield, mileage method, how you write line descriptions, how you handle meals and same-day trips, and any reasons a report was sent back. It never edits, saves or submits anything during this step.
4. **You confirm:** a short table of what it learned, plus anything that conflicts with district rules. Say "yes" or tell it what to fix.
5. **Saved:** your profile is saved to your Claude memory (or a doc, or text you keep). It's only in your account. Say **"update my travel profile"** anytime to change it.

New employee with no past TAs? Setup skips step 3 and uses sensible defaults.

## Everyday use

| You say | Claude does |
|---|---|
| "Create a TA for the CCC Data Summit, Oct 14–15 at the Riverside Convention Center" | Asks what's missing in one round, builds the attachment PDF, fills the TA, saves it as Pending |
| "Do my expense report for the Data Summit TA" | Asks what changed (days, hotel, parking, flights), gathers receipts, builds the combined PDF, creates the ER from the approved TA, saves as Pending |
| "My ER was sent back — fix it" | Reads the reviewer's reason and fixes only that |
| "Show my travel profile" / "Update my travel profile" | Shows or edits your saved details |

You always **review and click Submit yourself**.

## What it will and won't do

**Will:** measure mileage in Google Maps (fewest-miles route, both home and work comparisons), find your registration and agenda in your connected email, build one combined PDF (required by the district), redact airline loyalty numbers, fill every TA/ER line, check the totals, flag the 10-day ER deadline.

**Won't:** type your password, submit or certify for you, guess a dollar amount, or claim anything that breaks district travel rules.

## Privacy

- This repository contains **no one's personal information**. Your profile is created in **your own** Claude account during setup and is never added here.
- Your home address is used only to measure mileage.
- During setup, Claude reads your past TAs and ERs only to learn your filing conventions; it doesn't store amounts or trip details in your profile.

## What's in this repository

```
skills/sdccd-travel/
  SKILL.md                      main instructions (TA and ER workflows)
  reference/first-run-setup.md  setup interview + learning from past TAs/ERs
  reference/district-rules.md   rules that are the same for everyone
  reference/portal-playbook.md  how to drive myportal (verified Sep–Oct 2026)
  reference/profile-template.md the format of each person's profile
dist/sdccd-travel.zip           the file you upload to Claude
AGENTS.md                       instructions for an AI assistant helping someone install
.claude-plugin/                 Claude Code plugin + marketplace files
scripts/build.sh                rebuilds dist/sdccd-travel.zip
CHANGELOG.md
```

## Updating

When a new version comes out (see [CHANGELOG](CHANGELOG.md)): download the new `dist/sdccd-travel.zip`, then in **Customize → Skills** remove the old SDCCD Travel skill and upload the new one. Your profile stays in your memory, so you won't redo setup.

## Feedback

Something didn't work, or the portal changed? Open an issue on this repository, or tell the maintainer. Include what you asked for, what Claude did, and any error text from the portal (no personal details, please).

## For maintainers

- Edit files under `skills/sdccd-travel/`, then run `scripts/build.sh` to rebuild the zip, bump `version` in `.claude-plugin/plugin.json`, add a `CHANGELOG.md` entry, and commit.
- District-wide policy changes go in `reference/district-rules.md`. Portal changes go in `reference/portal-playbook.md`.
- Never commit anyone's profile, addresses, receipts, TA/ER numbers or screenshots. `scripts/build.sh` checks for common personal-data patterns, plus any terms you list in a git-ignored `scripts/denylist.local.txt` (one per line: your name, home address, chartfield values, past TA/ER IDs), and stops if it finds one.
