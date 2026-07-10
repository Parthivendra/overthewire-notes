# Bandit Level 17 → 18

**Date:** 10-07-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit17@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

There are 2 files in the homedirectory: **passwords.old and passwords.new**. The password for the next level is in **passwords.new** and is the only line that has been changed between **passwords.old and passwords.new**

**NOTE: if you have solved this level and see ‘Byebye!’ when trying to log into bandit18, this is related to the next level, bandit19**

---

## Commands / Solution

```bash
# Working commands used to solve the level
cat, grep, ls, diff

diff passwords.new passwords.old
diff passwords.new passwords.old --suppress-common-lines
diff passwords.new passwords.old --suppress-common-lines -y
diff passwords.new passwords.old --suppress-common-lines -u
diff passwords.new passwords.old --suppress-common-lines -u0
```

---

## Key Learnings

- Main concept learned:
	`diff`: compare files line by line
	Relative ordering of input files is preserved in `diff` output.
	>`diff` compares two text files line by line and reports the differences required to transform one file into the other. The ordering of the input files matters, since additions and deletions are reported relative to the first file.
	
- Important flags / tricks:
	`-q, --brief`: report only when files differ
	`-s, --report-identical-files`: report when two files are the same
	`-y, --side-by-side`: output in two columns
	`-u, --unified`: output NUM (default 3) lines of unified context (GitHub like difference)
	`--suppress-common-lines`: do not output common lines
- Common mistake to avoid:
	

---

## Password for Next Level

```text
OQxXZjELndr90zuhOTDYBEomI0SZITXI
```

---

## Notes / Tips

- Extra observations
	
- Related commands to explore later
	

---

## Links

- [[Linux-Commands-Cheatsheet]]
