# Live test guide: Claude version

A step-by-step script for a one-hour session where you help a colleague install the SDCCD Travel skill in **Claude** and file one practice Travel Authorization (TA). Using ChatGPT instead? See the [ChatGPT guide](live-test-guide-chatgpt.md).

**One rule for the whole meeting:** your colleague does all the clicking and typing. You read the steps out loud and point. That way we learn whether someone can do this alone.

---

## Before the meeting

**Your colleague brings:**

- [ ] A laptop with **Google Chrome**
- [ ] Their **Claude account** sign-in. Filling myportal needs a **paid plan (Pro or higher)**; the free plan can't use the browser.
- [ ] Their **myportal sign-in**, and their phone for the sign-in approval
- [ ] Their **budget numbers** for travel: Fund, Dept and Product (their admin can tell them). The AI can't see these on the portal.
- [ ] The name of their **department admin** who handles travel
- [ ] A **real trip coming up**: event name, dates, venue address with ZIP code, and the registration receipt or email. Hotel details too, if there is one.

**You bring:**

- [ ] The link: [github.com/hyang78227/sdccd-travel-skill](https://github.com/hyang78227/sdccd-travel-skill)
- [ ] This guide, open on your screen
- [ ] A notepad for anything that confuses them

**Timing:**

| Part | What happens | Time |
| --- | --- | --- |
| 1 | Install the skill | 10 min |
| 2 | Connect the browser | 5 min |
| 3 | First-time setup | 15 min |
| 4 | Live test: a practice TA | 25 min |
| 5 | Wrap-up and notes | 5 min |

---

## Part 1: Install the skill (10 minutes)

1. **Get the file.** Say: *"Open this link in Chrome: github.com/hyang78227/sdccd-travel-skill."*
    - Say: *"In the table near the top, click **sdccd-travel-claude.zip**."*
    - Say: *"On the right, click the **download** button (an arrow pointing down)."*
    - Say: *"Don't open or unzip it. Just leave it in Downloads."*
2. **Turn on the setting the skill needs.** Say: *"In Claude, click your name or picture in the bottom-left corner, then **Settings**, then **Capabilities**."*
    - Say: *"Turn on **Code execution and file creation**."*
    - Say: *"On the same page, make sure **memory** is on too."* (So Claude remembers their details next time.)
3. **Add the skill.** Say: *"Open **Customize**, then **Skills**. Click **+**, then **Create skill**, then **Upload a skill**."*
    - Say: *"Pick **sdccd-travel-claude.zip** from Downloads."*
    - Say: *"Check that the switch next to **sdccd-travel** is on."*
4. **Start fresh.** Say: *"Click **New chat**."* Skills only load when a chat starts.

**Check before moving on:** **sdccd-travel** is in Customize → Skills and switched on.

If a menu name looks a little different, that's normal; look for the closest match.

---

## Part 2: Connect the browser (5 minutes)

Use **Claude in Chrome**: it's the option that can also attach the PDF for them.

1. Say: *"In Chrome, go to the **Chrome Web Store** and search for **Claude**."* Make sure it's the one by Anthropic.
2. Say: *"Click **Add to Chrome**, then **Add extension**."*
3. Say: *"Click the puzzle-piece icon at the top right of Chrome, then the **pin** next to Claude."*
4. Say: *"Click the Claude icon and **sign in with the same Claude account**."*
5. Say: *"In a new tab, open **myportal** and sign in like you normally do."*

**Check before moving on:** the Claude icon is pinned and signed in, and myportal is open in a tab.

**Backup plan:** if Chrome won't cooperate, use the **Claude desktop app**. Its built-in browser can fill the forms; they'd attach the PDF themselves at the end.

---

## Part 3: First-time setup (15 minutes)

This happens once. Claude asks some questions, looks at their past travel paperwork, and saves what it learns.

1. **Start it.** In the new chat, they type: **Set up my SDCCD travel profile**
2. **Answer the questions.** Claude asks in one go: name, job title, department, home address, regular work location, budget numbers (Fund, Dept, Product), department admin, business purpose. "I don't know" is fine.
    - If they ask why it wants their home address: *"Only to measure mileage. It stays in your own Claude account."*
3. **Allow the websites.** Claude may ask permission to use **myportal.sdccd.edu**, **fsprd.sdccd.edu** and **google.com**. Say: *"Click allow; choose 'always' if it offers."*
4. **Sign in if asked.** They sign in to myportal themselves and type **done**. Claude never sees their password.
5. **Let Claude look at their history.** It opens their two most recent TAs and two most recent expense reports, **only to read them**. Tell them: *"It's just reading. It can't change or submit anything here."*
6. **Check what it learned.** Claude shows a short table: how they describe mileage, how they list meals, their budget numbers. They read each line and reply **yes**, or say what to fix.
7. **Saved.** Claude confirms the profile is saved. Next time it skips all of this.

**Check before moving on:** Claude says the profile is saved.

**Watch for:** a new employee with no past TAs. Claude skips step 5 and uses standard settings, which is expected.

---

## Part 4: Live test, a practice TA (25 minutes)

They create a real TA for their upcoming trip. Claude saves it as **Pending**, which means nothing goes to anyone until they choose to submit.

1. **Ask for it.** They type one sentence with the trip details, for example: **Create a TA for the CCC Data Summit, March 12 to 13, at the Pasadena Convention Center, 300 E Green St, Pasadena 91101.**
2. **Answer the questions.** Claude asks for anything missing in one round: registration cost, hotel, parking, which map to attach. They answer, and upload the registration receipt if asked.
3. **Check the PDF.** Claude makes **one combined PDF** (mileage map, agenda, receipts). Say: *"Open it and check everything is there and readable."*
4. **Watch Claude fill the TA.** It enters each line in myportal; it takes a few minutes. Tell them not to click in that tab while it works.
5. **Review the summary.** Claude reports the Authorization ID, every line, the total and the mileage it chose. Go through it together:
    - Do the dates match the trip?
    - Are the meals right (no meals the event provides)?
    - Is the mileage the shorter of home or work?
    - Is the PDF attached?
6. **Stop at Pending.** Claude does **not** submit. Say: *"When you're happy with it, you click Submit yourself, same as always."*

**Check before moving on:** a TA is in myportal with status **Pending**, with the PDF attached.

**After the trip:** they say **Do my expense report for the [event] TA**, and Claude does the same for the expense report.

---

## If something goes wrong

| What you see | What to do |
| --- | --- |
| No "Upload a skill" option | Settings → Capabilities: turn on **Code execution and file creation**, then look again. Still missing? Their plan or admin may block custom skills; note it. |
| The upload says the file is wrong | They may have unzipped it. Download **sdccd-travel-claude.zip** again and upload it unopened. |
| Claude doesn't seem to know the skill | Start a **new chat**, and check the skill's switch is on. |
| Claude says the browser isn't connected | Check the Claude icon in Chrome is signed in to the **same** account. Close and reopen Chrome, or use the desktop app. |
| Claude keeps asking about a website | Click allow, choosing "always" if offered. |
| myportal logged them out | Sign in again and type **done**. The portal times out after 60 minutes idle. |
| A pop-up box is stuck in myportal | They click **OK** on it, then tell Claude to continue. |
| Something on the TA looks wrong | Tell Claude in plain words, e.g. "The hotel is 2 nights, not 3." |
| Claude seems stuck for more than 2 minutes | Type **What's happening?** Still stuck? Type **stop** and take a screenshot. |

Whatever happens, the TA stays Pending until they submit it, so nothing goes out by mistake.

---

## Wrap-up (5 minutes)

**Confirm:**

- [ ] The skill is installed and switched on
- [ ] Their travel profile is saved
- [ ] A practice TA is in myportal as Pending, with the PDF attached
- [ ] They know they submit it themselves
- [ ] They know how to start next time: **Create a TA for…** or **Do my expense report for…**

**Write down:**

- Which step confused them, and the exact words they asked about
- Anything Claude got wrong in the profile or on the TA
- How long each part took
- Any error message (a screenshot is best)
- Their answer to: *"Would you use this on your next trip without me?"*

Send the notes to the maintainer (or open an issue on GitHub) so the skill and these steps can be fixed.
