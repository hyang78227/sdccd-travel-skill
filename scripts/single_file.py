"""Combine a skill folder into one SKILL.md: the main file, then each
reference file under its own heading. Usage:
  single_file.py <skill_dir> <platform.md> <out_path>
"""
import os, re, sys

skill_dir, platform_path, out_path = sys.argv[1:4]
main = open(os.path.join(skill_dir, "SKILL.md"), encoding="utf-8").read()
m = re.match(r"(---\n.*?\n---\n)(.*)", main, re.S)
front, body = m.group(1), m.group(2)

order = ["platform.md", "district-rules.md", "first-run-setup.md",
         "portal-playbook.md", "profile-template.md"]
ref_dir = os.path.join(skill_dir, "reference")
extra = sorted(f for f in os.listdir(ref_dir) if f.endswith(".md") and f not in order)

note = ("> **Single-file edition.** Every reference file is included below, each under a "
        "heading `Reference: <file name>`. Wherever this skill says `reference/<file>.md` "
        "or `<file>.md`, read that section of this file.\n\n")

parts = [front, "\n", note, body.strip(), "\n"]
for name in order + extra:
    path = platform_path if name == "platform.md" else os.path.join(ref_dir, name)
    text = open(path, encoding="utf-8").read().strip()
    # Demote the file's own headings one level so they sit under the section heading.
    text = re.sub(r"^(#{1,5}) ", lambda mm: "#" + mm.group(1) + " ", text, flags=re.M)
    parts += ["\n\n---\n\n# Reference: ", name, "\n\n", text, "\n"]

os.makedirs(os.path.dirname(out_path), exist_ok=True)
open(out_path, "w", encoding="utf-8").write("".join(parts))
