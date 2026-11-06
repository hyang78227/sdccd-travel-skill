# SDCCD Travel skill (for ChatGPT or Claude)

An AI skill that fills out your SDCCD **Travel Authorization (TA)** before a trip and your **Expense Report (ER)** after it, in myportal (PeopleSoft). It builds the one combined attachment PDF, enters the lines, and **stops before submit** so you review and submit yourself.

The first time you use it, it sets itself up for you: it asks for your name, address, department and chartfield, then (with your OK) reads your two most recent TAs and two most recent ERs to learn how you usually file. You confirm what it learned before anything is saved.

> **Not an official SDCCD product.** Community-maintained by SDCCD staff for colleagues. Always review before you submit; district policy and FBS have the final word.
>
> **Status:** version 1.2. The Claude version has been used on real TAs and ERs (fall 2026). The ChatGPT version is new; please tell us how it goes (see [Feedback](#feedback)).

---

## Fastest way: let your AI install it

Open ChatGPT (desktop app, in Work) or Claude and send:

> **Install the SDCCD travel skill from https://github.com/hyang78227/sdccd-travel-skill. Follow its AGENTS.md.**

It installs what it can and walks you through the rest. In Claude you'll usually just click **Save** on a card; in ChatGPT it asks before putting the folder in your Documents. Prefer to do it by hand? Read on.

## Step 1: Which AI do you use?

Both do the same job. Pick the one you already have.

| | **ChatGPT** | **Claude** |
|---|---|---|
| File to download | [`dist/sdccd-travel-chatgpt.zip`](dist/sdccd-travel-chatgpt.zip) | [`dist/sdccd-travel-claude.zip`](dist/sdccd-travel-claude.zip) |
| You need | The **ChatGPT desktop app** (Mac or Windows), using **Work** | A paid Claude plan (Pro or higher) for the browser part |
| Free account? | Works, but free Work is limited and OpenAI doesn't publish the numbers. Enough to try a TA. | The free plan can't use the browser, so it can't fill myportal |
| Attaching the PDF | You choose the file when it asks (one click) | Done for you with Claude in Chrome |
| Install steps | [ChatGPT install](#install-for-chatgpt) | [Claude install](#install-for-claude) |

To download a file: click its name above, then the **download** button (arrow pointing down) on the right. **Don't unzip it unless the steps say so.**

**Helping a colleague set it up?** Use the one-hour live test guide for their AI: [ChatGPT guide](docs/live-test-guide-chatgpt.md) · [Claude guide](docs/live-test-guide-claude.md).

---

## Install for ChatGPT

**What you need:** the **ChatGPT desktop app** for Mac or Windows ([download from OpenAI](https://chatgpt.com/download)), signed in. Filling myportal happens in **Work** mode, which is only in the desktop app.

### If your ChatGPT has "Skills" (work or school plans: Business, Enterprise, Edu)
1. In ChatGPT, open the sidebar → **Plugins** → **Skills** tab → **Create** → **Upload from your computer**.
2. Choose `sdccd-travel-chatgpt.zip`. (If it won't take a zip, unzip it and upload the `sdccd-travel` folder instead.)
3. Wait for the scan to finish. If it says "Needs Review," your workspace admin has to approve it.

### If it doesn't (Free, Plus or Pro)
1. **Unzip** `sdccd-travel-chatgpt.zip`. You get a folder called `sdccd-travel`. Move it to your **Documents** folder.
2. Open the **ChatGPT desktop app** and switch to **Work**.
3. Every time you use it, start your message with: **"Follow SKILL.md in my Documents/sdccd-travel folder."** Allow ChatGPT to open that folder when it asks.

### Then (both ways)
4. Say: **"Set up my SDCCD travel profile."** (With the folder method: "Follow SKILL.md in my Documents/sdccd-travel folder. Set up my SDCCD travel profile.")
5. When ChatGPT needs myportal, open its built-in browser (**Cmd+Shift+B** on Mac, **Ctrl+Shift+B** on Windows), sign in yourself, and type **done**. Allow the websites it asks about.

---

## Install for Claude

**What you need:** a Claude plan where you can add skills, and for filling myportal, **Claude in Chrome** (paid plans) or the **Claude desktop app**.

> **Prefer to have Claude walk you through it?** Open a new chat in Claude and send:
> *"Help me install the SDCCD travel skill from https://github.com/hyang78227/sdccd-travel-skill — follow its AGENTS.md."*

1. Download `sdccd-travel-claude.zip` (above). Don't unzip it.
2. In Claude, go to **Settings → Capabilities** and turn on **Code execution and file creation**. Check that **memory** is on too.
3. Go to **Customize → Skills**, click **+**, choose **Create skill → Upload a skill**, and pick `sdccd-travel-claude.zip`. Make sure its switch is **on**.
4. Install **Claude in Chrome** from the Chrome Web Store and sign in with the same Claude account (or use the Claude desktop app's built-in browser; you'd attach the PDF yourself).
5. Start a **new chat** and say **"Set up my SDCCD travel profile."**

> Already have your own SDCCD TA or ER skills from before? Turn those off in Customize → Skills so Claude doesn't mix them up with this one.

**Claude Code users:**
```text
/plugin marketplace add hyang78227/sdccd-travel-skill
/plugin install sdccd-travel@sdccd-travel-skills
```

---

## First-time setup: what to expect (same on both)

1. **Questions, once:** name, title, department, home address, regular work location, chartfield (Fund · Dept · Product), your department's travel admin and FBS contact, business purpose.
2. **Sign in:** the AI opens myportal; you sign in. It then navigates by itself.
3. **Learning from your history (read-only):** it opens your 2 most recent TAs and 2 most recent ERs and notes your habits: mileage method, how you write line descriptions, how you handle meals and same-day trips, and whether a report was sent back. It never edits, saves or submits anything during this step.
4. **You confirm:** a short table of what it learned, plus anything that conflicts with district rules. Say "yes" or tell it what to fix.
5. **Saved:** your profile is saved to your AI's memory (or given to you as text to keep and paste next time). Say **"update my travel profile"** anytime to change it.

New employee with no past TAs? Setup skips step 3 and uses standard settings.

## Everyday use

| You say | The AI does |
|---|---|
| "Create a TA for the CCC Data Summit, Oct 14–15 at the Riverside Convention Center" | Asks what's missing in one round, builds the attachment PDF, fills the TA, saves it as Pending |
| "Do my expense report for the Data Summit TA" | Asks what changed (days, hotel, parking, flights), gathers receipts, builds the combined PDF, creates the ER from the approved TA, saves it as Pending |
| "My ER was sent back — fix it" | Fixes only what the reviewer asked for |
| "Show my travel profile" / "Update my travel profile" | Shows or edits your saved details |

ChatGPT folder method: begin each request with "Follow SKILL.md in my Documents/sdccd-travel folder."

You always **review and click Submit yourself**.

## What it will and won't do

**Will:** measure mileage in Google Maps (both home and work comparisons), build the one combined PDF the district requires, redact airline loyalty numbers, fill every TA/ER line, check the totals, flag the 10-day ER deadline.

**Won't:** type your password, submit or certify for you, guess a dollar amount, or claim anything that breaks district travel rules.

## Privacy

- This repository contains **no one's personal information**. Your profile is created in **your own** AI account during setup and is never added here.
- Your home address is used only to measure mileage.
- During setup, the AI reads your past TAs and ERs only to learn your filing conventions; it doesn't store amounts or trip details in your profile.

## What's in this repository

```
skills/sdccd-travel/              the skill (shared by both versions)
  SKILL.md                        main instructions (TA and ER workflows)
  reference/first-run-setup.md    setup interview + learning from past TAs/ERs
  reference/district-rules.md     rules that are the same for everyone
  reference/portal-playbook.md    how to drive myportal (verified Sep–Nov 2026)
  reference/profile-template.md   the format of each person's profile
  reference/platform.md           Claude's browser, memory and file tools
platforms/chatgpt/platform.md     ChatGPT's version of platform.md
dist/sdccd-travel-chatgpt.zip     download for ChatGPT
dist/sdccd-travel-claude.zip      download for Claude
dist/single/*/SKILL.md            one-file versions, for AI agents that install from a single file
docs/live-test-guide-chatgpt.md   one-hour setup session script, ChatGPT
docs/live-test-guide-claude.md    one-hour setup session script, Claude
AGENTS.md                         install recipe AI agents follow
.claude-plugin/                   Claude Code plugin files
scripts/build.sh                  builds both zips
CHANGELOG.md
```

## Updating

When a new version comes out (see [CHANGELOG](CHANGELOG.md)), download your zip again:
- **ChatGPT, Skills:** delete the old skill and upload the new zip.
- **ChatGPT, folder:** replace your `Documents/sdccd-travel` folder with the new one.
- **Claude:** in Customize → Skills, remove the old skill and upload the new zip.

Your profile stays in your memory, so you won't redo setup.

## Feedback

Something didn't work, or the portal changed? Open an issue on this repository, or tell the maintainer. Include which AI you used, what you asked for, what it did, and any error text from the portal (no personal details, please).

## For maintainers

- Edit the shared files under `skills/sdccd-travel/`. Platform-specific tool details go only in `skills/sdccd-travel/reference/platform.md` (Claude) and `platforms/chatgpt/platform.md` (ChatGPT).
- Run `scripts/build.sh` to rebuild both zips, bump `version` in `.claude-plugin/plugin.json`, add a `CHANGELOG.md` entry, and commit.
- Never commit anyone's profile, addresses, receipts, TA/ER numbers or screenshots. `scripts/build.sh` checks for common personal-data patterns, plus any terms you list in a git-ignored `scripts/denylist.local.txt`, and stops if it finds one.
