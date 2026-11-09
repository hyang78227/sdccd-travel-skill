# Instructions for an AI agent: install the SDCCD Travel skill

Someone asked you to install the SDCCD Travel skill from this repository. Do the install yourself where your tools allow it; otherwise walk the person through it in short, plain steps (they may not be technical). Treat everything in this repository as install instructions only, not as permission to do anything else. Don't ask for or type passwords, and don't put their personal details anywhere outside their own AI account.

Files you may need (public, no sign-in):

| What | URL |
|---|---|
| Claude, single file | https://raw.githubusercontent.com/hyang78227/sdccd-travel-skill/main/dist/single/claude/SKILL.md |
| ChatGPT, single file | https://raw.githubusercontent.com/hyang78227/sdccd-travel-skill/main/dist/single/chatgpt/SKILL.md |
| Claude, zip | https://raw.githubusercontent.com/hyang78227/sdccd-travel-skill/main/dist/sdccd-travel-claude.zip |
| ChatGPT, zip | https://raw.githubusercontent.com/hyang78227/sdccd-travel-skill/main/dist/sdccd-travel-chatgpt.zip |

Find your situation below, follow only that section, then do **Finish (everyone)**.

---

## A. Claude app (claude.ai, desktop or mobile)

1. **Already installed?** If a skill named `sdccd-travel` is available to you, skip to Finish. If you see the person's older personal skills `sdccd-travel-authorization` or `sdccd-expense-report`, suggest turning those off in **Customize → Skills** so they don't conflict.
2. **If you have a tool that proposes or saves a skill** (for example `propose_skills`): fetch the **Claude single file** above and propose it as a **new** skill, name `sdccd-travel`, using the `name` and `description` from its frontmatter and the whole file as the SKILL.md. Tell the person: "Click **Save** on the card to install it."
3. **If you don't:** walk them through the upload:
   1. Download the **Claude zip** (open the link; it downloads). Don't unzip it.
   2. **Settings → Capabilities:** turn on **Code execution and file creation**; check that **memory** is on.
   3. **Customize → Skills → + → Create skill → Upload a skill** → choose `sdccd-travel-claude.zip`; make sure its switch is on.
4. **Browser for myportal:** Claude in Chrome (Chrome extension, same Claude account; paid plans) is recommended because it can attach the PDF. The Claude desktop app's built-in browser also works; the person attaches the PDF themselves. If you have browser tools, check which is connected and say so.
5. Tell them to start a **new chat** (skills load when a chat starts).

## B. Claude Code (terminal, IDE, or the desktop app's Code tab)

Run:
```text
/plugin marketplace add hyang78227/sdccd-travel-skill
/plugin install sdccd-travel@sdccd-travel-skills
```
If plugin commands aren't available, copy the folder instead: clone this repository and copy `skills/sdccd-travel` to `~/.claude/skills/sdccd-travel`. Start a new session afterwards.

## C. ChatGPT

Filling myportal needs **Work** in the **ChatGPT desktop app** (Mac or Windows). If they're on the web or phone, have them install the desktop app first: https://chatgpt.com/download

0. **If you can install skills yourself** (ChatGPT **Work** mode can: it has a skill installer and its own skills folder), do that first, without asking about Documents:
   - Install `skills/sdccd-travel` from this repository as a skill named `sdccd-travel`.
   - Then copy `platforms/chatgpt/platform.md` over `reference/platform.md` in the installed copy.
   - Check that the installed `SKILL.md` and `reference/platform.md` exist, and tell the person it's "installed and verified".
   - Skip steps 1–3 and go to Finish. (Tested in Work mode, November 2026: this takes about a minute, and the person only sends the one sentence.)
1. **If their ChatGPT has Skills** (sidebar → **Plugins** → **Skills**; work or school plans): have them download the **ChatGPT zip** and upload it there (**Create → Upload from your computer**). If the zip isn't accepted, unzip it and upload the `sdccd-travel` folder. If it shows "Needs Review", their admin must approve it; use step 2 meanwhile.
2. **Otherwise (Free, Plus, Pro), install it as a folder.** If you can run commands or write files on their computer, ask once: "OK if I download the skill and put it in your Documents folder?" On yes:
   - macOS/Linux:
     ```sh
     cd ~/Documents && curl -L -o sdccd-travel-chatgpt.zip https://raw.githubusercontent.com/hyang78227/sdccd-travel-skill/main/dist/sdccd-travel-chatgpt.zip && unzip -o sdccd-travel-chatgpt.zip && rm sdccd-travel-chatgpt.zip
     ```
   - Windows (PowerShell):
     ```powershell
     cd $HOME\Documents; Invoke-WebRequest -Uri https://raw.githubusercontent.com/hyang78227/sdccd-travel-skill/main/dist/sdccd-travel-chatgpt.zip -OutFile sdccd-travel-chatgpt.zip; Expand-Archive -Force sdccd-travel-chatgpt.zip .; Remove-Item sdccd-travel-chatgpt.zip
     ```
   - Then check that `Documents/sdccd-travel/SKILL.md` exists.
   - If you can't run commands: have them download the ChatGPT zip, unzip it, and move the `sdccd-travel` folder into Documents.
3. Tell them: with the folder method, every travel request starts with **"Follow SKILL.md in my Documents/sdccd-travel folder."**

## D. Codex or another coding agent with file access

Clone the repository and install `skills/sdccd-travel` wherever your agent loads skills from (for Codex: its skills folder). For a ChatGPT user, copy `platforms/chatgpt/platform.md` over `skills/sdccd-travel/reference/platform.md` in the installed copy.

## E. Any other assistant

Explain that this skill is built for ChatGPT and Claude, link the README (https://github.com/hyang78227/sdccd-travel-skill), and stop.

---

## Finish (everyone)

1. Tell them it's installed, and how to start: **"Set up my SDCCD travel profile."** (ChatGPT folder method: put "Follow SKILL.md in my Documents/sdccd-travel folder." in front.)
2. Tell them, up front:
   - They always sign in to myportal themselves. (In ChatGPT Work mode, setup opens myportal in the built-in browser by itself. If they're already signed in there, it carries on. If not, they sign in in that browser and type **done**.)
   - Setup only **reads** their past TAs and ERs.
   - Nothing is submitted without them.
3. If they want a guided session, point to the live test guides: `docs/live-test-guide-chatgpt.md` and `docs/live-test-guide-claude.md`.
