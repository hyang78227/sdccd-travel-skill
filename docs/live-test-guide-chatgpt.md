# Live test guide: ChatGPT version

A step-by-step script for a one-hour session where you help a colleague install the SDCCD Travel skill in **ChatGPT** and file one practice Travel Authorization (TA). Using Claude instead? See the [Claude guide](live-test-guide-claude.md).

**One rule for the whole meeting:** your colleague does all the clicking and typing. You read the steps out loud and point. That way we learn whether someone can do this alone.

---

## Before the meeting

**Your colleague brings:**

- [ ] A **Mac or Windows laptop** (not a phone or tablet)
- [ ] Their **ChatGPT account** sign-in (a free account is fine for one try)
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
| 1 | Get the ChatGPT desktop app | 10 min |
| 2 | Add the skill | 5 min |
| 3 | First-time setup | 15 min |
| 4 | Live test: a practice TA | 25 min |
| 5 | Wrap-up and notes | 5 min |

---

## Part 1: Get the ChatGPT desktop app (10 minutes)

The website and phone app can't fill out myportal. Only the **desktop app** can, using a mode called **Work**.

1. Say: *"Go to **chatgpt.com/download** and download the app for your computer."*
2. Say: *"Install it and open it, then sign in with your ChatGPT account."*
3. Say: *"Look for **Work** at the top or in the sidebar and switch to it."*

**Check before moving on:** the ChatGPT desktop app is open, signed in, and in Work.

---

## Part 2: Add the skill (5 minutes)

1. **Get the file.** Say: *"Open this link: github.com/hyang78227/sdccd-travel-skill."*
    - Say: *"In the table near the top, click **sdccd-travel-chatgpt.zip**."*
    - Say: *"On the right, click the **download** button (an arrow pointing down)."*
2. **Find out which way to install.** Say: *"In ChatGPT, open the sidebar. Do you see **Plugins**, and inside it a **Skills** tab?"*

**If yes (work or school ChatGPT plans):**

3. Say: *"Click **Skills**, then **Create**, then **Upload from your computer**, and pick **sdccd-travel-chatgpt.zip** from Downloads."*
4. If it won't accept the zip: *"Double-click the zip to unzip it, then upload the **sdccd-travel** folder instead."*
5. Wait for the check to finish. If it says **Needs Review**, their admin has to approve it, so use the "If no" steps for today.

**If no (Free, Plus or Pro):**

3. Say: *"Double-click **sdccd-travel-chatgpt.zip** in Downloads to unzip it. You'll get a folder called **sdccd-travel**."*
4. Say: *"Drag that folder into your **Documents** folder."*
5. Tell them: *"From now on, start every travel request with: **Follow SKILL.md in my Documents/sdccd-travel folder.**"*

**Check before moving on:** the skill shows in Skills, *or* the **sdccd-travel** folder is in Documents.

---

## Part 3: First-time setup (15 minutes)

This happens once. ChatGPT asks some questions, looks at their past travel paperwork, and saves what it learns.

1. **Start it.** In Work, they type:
    - Skills way: **Set up my SDCCD travel profile**
    - Folder way: **Follow SKILL.md in my Documents/sdccd-travel folder. Set up my SDCCD travel profile.**
2. **Allow the folder** (folder way only). If ChatGPT asks to open the **sdccd-travel** folder, click allow.
3. **Answer the questions.** ChatGPT asks in one go: name, job title, department, home address, regular work location, budget numbers (Fund, Dept, Product), department admin, business purpose. "I don't know" is fine.
    - If they ask why it wants their home address: *"Only to measure mileage. It stays in your own ChatGPT account."*
4. **Open the browser and sign in.** When ChatGPT needs myportal, say: *"Press **Cmd+Shift+B** (Mac) or **Ctrl+Shift+B** (Windows) to open ChatGPT's browser. Sign in to myportal there, then type **done**."* ChatGPT never sees their password.
5. **Allow the websites.** ChatGPT asks before using each new site. Tell them: *"Allow **myportal.sdccd.edu**, **fsprd.sdccd.edu** and **google.com**."*
6. **Let ChatGPT look at their history.** It opens their two most recent TAs and two most recent expense reports, **only to read them**. Tell them: *"It's just reading. It won't change or submit anything here."*
7. **Check what it learned.** ChatGPT shows a short table: how they describe mileage, how they list meals, their budget numbers. They read each line and reply **yes**, or say what to fix.
8. **Saved.** ChatGPT saves their profile to its memory. If memory is off, it gives them a block of text: they save it as **my-travel-profile.txt** in the sdccd-travel folder and paste it at the start of future travel chats.

**Check before moving on:** ChatGPT says the profile is saved (or they've saved the text).

**Watch for:** a new employee with no past TAs. ChatGPT skips step 6 and uses standard settings, which is expected.

---

## Part 4: Live test, a practice TA (25 minutes)

They create a real TA for their upcoming trip. ChatGPT saves it as **Pending**, which means nothing goes to anyone until they choose to submit.

1. **Ask for it.** They type one sentence with the trip details (folder way: start with "Follow SKILL.md in my Documents/sdccd-travel folder."), for example: **Create a TA for the CCC Data Summit, March 12 to 13, at the Pasadena Convention Center, 300 E Green St, Pasadena 91101.**
2. **Answer the questions.** ChatGPT asks for anything missing in one list: registration cost, hotel, parking, which map to attach. They answer, and upload the registration receipt if asked.
3. **Download and check the PDF.** ChatGPT makes **one combined PDF** (mileage map, agenda, receipts) to download. Say: *"Download it, open it, and check everything is there and readable. Remember where you saved it."*
4. **Watch ChatGPT fill the TA.** It enters each line in myportal; this takes several minutes. Tell them not to click in that browser while it works.
5. **Attach the PDF yourself.** ChatGPT's browser can't attach files, so it opens the attachment box and asks them. Say: *"Click **Choose File**, pick the PDF, click **Upload**, then type **done**."* ChatGPT finishes the rest.
6. **Review the summary.** ChatGPT reports the Authorization ID, every line, the total and the mileage it chose. Go through it together:
    - Do the dates match the trip?
    - Are the meals right (no meals the event provides)?
    - Is the mileage the shorter of home or work?
    - Is the PDF attached?
7. **Stop at Pending.** ChatGPT does **not** submit. Say: *"When you're happy with it, you click Submit yourself, same as always."*

**Check before moving on:** a TA is in myportal with status **Pending**, with the PDF attached.

**If ChatGPT stops partway** (the free account's limit): whatever it saved stays in myportal as Pending. They can finish the remaining lines by hand from the list ChatGPT gave them, or continue another day.

**After the trip:** they say **Do my expense report for the [event] TA**, and ChatGPT does the same for the expense report.

---

## If something goes wrong

| What you see | What to do |
| --- | --- |
| No **Work** option | Make sure it's the **desktop app**, not the website. Update the app. |
| No **Plugins → Skills** | Normal on Free, Plus and Pro. Use the folder way. |
| Skill says **Needs Review** | Their workspace admin must approve it. Use the folder way today. |
| ChatGPT can't find the folder | Check the folder is named **sdccd-travel** and is directly inside **Documents**. Allow access when asked. |
| ChatGPT doesn't seem to follow the skill | Folder way: start the message with **Follow SKILL.md in my Documents/sdccd-travel folder.** Skills way: type **@** and pick the skill. |
| The browser won't open | Cmd+Shift+B (Mac) / Ctrl+Shift+B (Windows), or the browser button in the toolbar. |
| Microsoft sign-in fails in ChatGPT's browser | Write down the exact error. This is the most important thing to learn from today's test. |
| ChatGPT keeps asking about a website | Click allow. |
| myportal logged them out | Sign in again and type **done**. The portal times out after 60 minutes idle. |
| ChatGPT clicks the wrong field or seems stuck | Type **Stop. Show me what you've entered so far.** Fix by telling it in plain words, e.g. "The hotel is 2 nights, not 3." |
| It hits a usage limit | Normal on free accounts. What's saved stays saved. Note how far it got. |

Whatever happens, the TA stays Pending until they submit it, so nothing goes out by mistake.

---

## Wrap-up (5 minutes)

**Confirm:**

- [ ] The skill is installed (Skills) or the folder is in Documents
- [ ] Their travel profile is saved
- [ ] A practice TA is in myportal as Pending, with the PDF attached
- [ ] They know they submit it themselves
- [ ] They know how to start next time

**Write down:**

- Which step confused them, and the exact words they asked about
- Whether the Microsoft sign-in worked in ChatGPT's browser
- How far ChatGPT got on a free account before any limit
- Anything ChatGPT got wrong in the profile or on the TA
- How long each part took
- Any error message (a screenshot is best)
- Their answer to: *"Would you use this on your next trip without me?"*

Send the notes to the maintainer (or open an issue on GitHub) so the skill and these steps can be fixed.
