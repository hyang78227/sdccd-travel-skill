# Platform: ChatGPT

This copy of the skill is the **ChatGPT** version. Read this file before the first portal step; it says which tools you have. Everything else in the skill is the same for every AI.

The traveler should be using **ChatGPT Work in the ChatGPT desktop app** (Mac or Windows). Work is what can run a browser and code. In a normal chat (or on the web or phone), you can still do everything up to the portal: the questions, the mileage, the PDF and the full line list. Then give the traveler the lines to enter themselves.

## How this skill reached you

Either way works; the instructions are the same:
- **Installed as a ChatGPT Skill** (Business, Enterprise, Healthcare or Edu workspaces), or
- **A folder on the traveler's computer** that they pointed you to ("follow SKILL.md in the sdccd-travel folder"). Read `SKILL.md` and the `reference/` files from that folder whenever a step needs them.

## Browser (for myportal and Google Maps)

Use the **built-in browser** in the ChatGPT desktop app.

- The traveler opens it with the toolbar button or **Cmd+Shift+B** (Mac) / **Ctrl+Shift+B** (Windows).
- **Sign-in:** the traveler signs in to myportal inside the browser pane themselves; wait for them to say "done". Never ask for a password in chat.
- **Website permission:** ChatGPT asks before using each new site. Tell the traveler to allow `myportal.sdccd.edu`, `fsprd.sdccd.edu` and `google.com`.
- **What you can do on a page:** open tabs, click, type, read what's on screen, take screenshots, download files.
- **Scripts in the page:** only with **Developer mode** (Settings → Browser), with approval per site. If it's on, the P3 helpers in `portal-playbook.md` work and are much more reliable. If it's off, use the click-and-type fallback in P1: the field ids still tell you which field is which, the form sits inside a frame, and every change takes about 5 seconds to save, so wait before the next field. Re-read the lines after each one.
- **Uploading the PDF:** the built-in browser **can't** put a file into a form's file picker. Skip the script steps in P7. At the attach step, open Attachments → Add Attachment, then ask the traveler to choose the PDF from their computer, click Upload and type "done". You then fill the description and save.

## Memory (the travel profile)

- Save the profile as **one saved memory** that starts with the line `SDCCD TRAVEL PROFILE` (format in `profile-template.md`), but only after the traveler says yes in setup.
- If memory is off or unavailable, give them the profile as a text block and ask them to keep it (a note, or the folder this skill lives in as `my-travel-profile.txt`) and paste it at the start of the next travel chat.

## Files

- Build the combined PDF with Python (`reportlab`, `pypdf`, `pymupdf`) and give the traveler the finished file to download. Ask them to save it where they can find it for the attach step.
- If you can't run Python, list exactly which pages go into the PDF and in what order, and tell the traveler how to combine them (for example "Print → Save as PDF" or any PDF tool they use).
- Questions: ask everything missing as one short numbered list.

## Limits to tell the traveler about up front

- On a free ChatGPT account, Work is limited and OpenAI doesn't publish the numbers. If you're cut off mid-run, everything you saved in myportal stays saved as Pending; the traveler can finish by hand from the line list, or continue later.
