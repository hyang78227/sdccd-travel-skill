# Changelog

## 1.1.0 — 2026-11-04

- Two downloads from one source: `dist/sdccd-travel-chatgpt.zip` and `dist/sdccd-travel-claude.zip`. Only `reference/platform.md` differs (browser, memory and file tools).
- ChatGPT support: runs in ChatGPT Work with the desktop app's built-in browser; installs as a ChatGPT Skill or as a folder for plans without Skills; the traveler chooses the PDF at the attach step.
- Portal playbook: click-and-type fallback when page scripts aren't available.
- Setup: read-only path to past TAs and ERs verified on a live dry run (Nov 2026).

## 1.0.0 — 2026-11-04

First team version.

- One skill covering both Travel Authorizations and Expense Reports.
- First-run setup: profile questions, then a read-only review of the traveler's 2 most recent TAs and ERs to learn their conventions, confirmed before saving.
- Profile saved in the traveler's Claude memory (fallbacks: a Claude Doc, or text to paste).
- District rules separated from personal conventions; one combined attachment PDF required for every TA and ER.
- Mileage method per traveler: `lesser-of` (default) or `deduct-commute`, learned from history.
- Portal playbook (P1–P10) verified on real runs, Sep–Oct 2026.
