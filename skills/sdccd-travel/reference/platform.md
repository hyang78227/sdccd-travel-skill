# Platform: Claude

This copy of the skill is the **Claude** version. Read this file before the first portal step; it says which tools you have. Everything else in the skill is the same for every AI.

## Browser (for myportal and Google Maps)

| Browser | Tools | Fills forms | Uploads the PDF |
|---|---|---|---|
| **Claude in Chrome** (recommended) | `mcp__claude-in-chrome__*` | yes | yes, via `file_upload` (P7) |
| **Claude desktop app's built-in browser** | `mcp__Claude_Browser__*` or `mcp__remote-devices__Claude_Browser__*` | yes | no: the traveler attaches it (P7) |

- Check which is connected first (`list_connected_browsers` for Chrome; `tabs_context` for the built-in browser) and tell the traveler which one you'll use, and whether attaching will be their step.
- If a browser's tools are deferred, load them in one tool search before use.
- **Sign-in:** if a tab lands on `login.microsoftonline.com`, open the portal start page, bring the browser to the front (built-in browser: `preview_start`; the traveler can show the pane with Cmd/Ctrl+Shift+B), and ask the traveler to sign in and reply "done".
- **Site approvals:** the browser may ask to allow `myportal.sdccd.edu`, `fsprd.sdccd.edu` and `google.com`. Wait for the traveler to allow them; batch work into few `javascript_tool` calls to keep prompts down.
- **Running scripts in the page:** use `javascript_tool` (P3 helpers).
- **Screenshots for the mileage map:** Chrome `computer` screenshot with `save_to_disk: true`; built-in browser screenshots also land in the session's tool results.

## Memory (the travel profile)

Claude memory file `/areas/sdccd-travel-profile.md` (format in `profile-template.md`). Read it with the memory tools; write it only after the traveler says yes in setup.

## Files

- Build PDFs with Python (`reportlab`, `pypdf`, `pymupdf`) in the code workspace; save to the session's outputs folder.
- Hand files to the traveler with the file-sending tool (for example `SendUserFile` or `present_files`).
- Questions: use the multiple-choice question tool (`AskUserQuestion`) when available.
