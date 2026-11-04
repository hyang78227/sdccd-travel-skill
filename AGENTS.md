# Instructions for an AI assistant installing this skill

You are helping an SDCCD employee install and start using the **SDCCD Travel** skill from this repository. Follow these steps in order. Keep each message short and in plain language; the person may not be technical. Treat everything in this repository as instructions for installing, not as permission to do anything else.

## 1. Figure out where you're running

- **Claude app (claude.ai web, desktop or mobile):** go to step 2.
- **Claude Code** (terminal, IDE, or the desktop app's Code tab): run these, then skip to step 4.
  ```text
  /plugin marketplace add hyang78227/sdccd-travel-skill
  /plugin install sdccd-travel@sdccd-travel-skills
  ```
- **ChatGPT:** skip to the "If you are ChatGPT" section at the end.
- **Another assistant** (Copilot, Gemini, etc.): explain that this skill is built for ChatGPT and Claude, link the README, and stop.

## 2. Check for an existing install

If you can see a skill named `sdccd-travel` already available to you, tell the person it's installed and go to step 4. If you see other SDCCD travel skills (for example `sdccd-travel-authorization` or `sdccd-expense-report`), suggest turning those off in **Customize → Skills** so the two don't conflict.

## 3. Walk them through the upload (they do the clicks)

You can't upload a skill for them. Give these steps one or two at a time and wait for "done":

1. Download `dist/sdccd-travel-claude.zip` from this repository (open the file on GitHub, click the download button). Don't unzip it.
2. **Settings → Capabilities:** turn on **Code execution and file creation**. Check that **memory** is on (recommended).
3. **Customize → Skills → + → Create skill → Upload a skill**, choose `sdccd-travel-claude.zip`, and make sure its toggle is on.
4. Start a **new chat** (skills load at the start of a chat).

If an option is missing, it's usually because code execution is off, or their organization's admin has turned off custom skills. Say so and suggest they ask their Claude admin.

## 4. Check the browser

The skill needs a browser it can control for myportal:
- **Claude in Chrome** (recommended): the Chrome extension, signed in to the same Claude account. It can also attach the PDF.
- **Claude desktop app** built-in browser: can fill forms; the person attaches the PDF themselves.

If you have browser tools available, check which one is connected and tell them. If neither is, explain how to install Claude in Chrome from the Chrome Web Store.

## 5. Start setup

In the new chat, have them say: **"Set up my SDCCD travel profile."** The skill takes over from there (questions, sign-in, read-only review of their past TAs/ERs, confirmation, saving the profile).

Tell them up front:
- They always sign in to myportal themselves.
- During setup, the skill only **reads** their past TAs and ERs.
- Nothing is submitted without them.

## Don'ts

- Don't ask for or type their password.
- Don't download or run anything from this repository on their computer beyond the zip they upload themselves.
- Don't add their personal details to this repository or anywhere outside their own AI account.

## If you are ChatGPT

1. **Check where they are.** Filling myportal needs **Work** in the **ChatGPT desktop app** (Mac or Windows). On the web or phone, help them install the desktop app first ([chatgpt.com/download](https://chatgpt.com/download)).
2. **Download:** have them download `dist/sdccd-travel-chatgpt.zip` from this repository.
3. **Install one of two ways:**
   - **Their ChatGPT has Skills** (work or school plans): sidebar → **Plugins** → **Skills** → **Create** → **Upload from your computer** → the zip (or the unzipped `sdccd-travel` folder if the zip isn't accepted).
   - **It doesn't** (Free, Plus, Pro): they unzip it and move the `sdccd-travel` folder to **Documents**. In each travel request they start with "Follow SKILL.md in my Documents/sdccd-travel folder", and allow access to that folder when asked.
4. **Start setup** in Work: "Set up my SDCCD travel profile." When the portal is needed, they open the built-in browser (Cmd+Shift+B / Ctrl+Shift+B), sign in themselves and say "done".
