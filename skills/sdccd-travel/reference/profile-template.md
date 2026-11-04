# Travel profile format

Save exactly this shape. In Claude memory, save it at `/areas/sdccd-travel-profile.md` with the frontmatter below. In a Claude Doc, title it `My SDCCD Travel Profile` and use the body only. As pasted text, start it with the line `SDCCD TRAVEL PROFILE`.

Every value is something the traveler said or confirmed during setup. Leave a field blank rather than guessing.

```markdown
---
name: sdccd-travel-profile
description: SDCCD travel profile for TAs and expense reports — check before filing travel paperwork
sources: [chat]
aliases: [travel profile, SDCCD travel profile]
---

## Traveler
- [stated] Name: <full name>
- [stated] Title: <job title>
- [stated] Department / division: <name>
- [stated] Email to search for registrations and receipts: <address>

## Locations
- [stated] Home address: <street, city, ZIP>
- [stated] Regular work location: <name and address>
- [stated] Home → work: <miles> mi one way (measured <YYYY-MM-DD>)

## Accounting
- [stated] Chartfield: Fund <####> · Dept <#####> · Product <######>
- [stated] Default business purpose: <code and label, e.g. PRDEV Professional Development>

## Contacts
- [stated] Department admin(s) for travel: <names>
- [stated] FBS contact: <name>

## Tools
- [stated] Browser for the portal: <Claude in Chrome | Claude desktop app browser pane>

## Conventions (learned from past TAs/ERs, confirmed by the traveler)
- [stated] mileage_method: <lesser-of | deduct-commute>
- [stated] default_maps: <home→venue | work→venue | both>
- [stated] meal_lines: <one line per meal not provided | one DINNER line per day between first and last day | other: ...>
- [stated] description_style: <example mileage description, e.g. "3/14 Home to Pasadena Convention Center (112.4 mi)">
- [stated] same_day_wording: <e.g. "First/Last day of travel (same-day trip)">
- [stated] attachment_label: <e.g. "<EVENT> TA Attachments">
- [stated] notes from past send-backs: <reason, or none>

## Setup
- [stated] Learned from: <TA IDs and ER IDs reviewed, or "no history, defaults used">
- [stated] Last updated: <YYYY-MM-DD>
```

## Defaults (when there's no history)

| Field | Default |
|---|---|
| mileage_method | `lesser-of` (tell the traveler some district travel guides' examples show `deduct-commute`, and suggest confirming with their department admin before the first trip) |
| default_maps | `both` |
| meal_lines | one line per meal not provided |
| description_style | "Travel to event – home to <venue> (X mi)" / "Return from event – <venue> to home (X mi)" |
| same_day_wording | "First/Last day of travel (same-day trip)" |
| attachment_label | "<EVENT> TA Attachments" / "<EVENT> ER Receipts and Documentation" |
| business purpose | `PRDEV` Professional Development (ask; not every trip is professional development) |
