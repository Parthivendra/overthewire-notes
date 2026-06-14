# Bandit Level 04 → 05

**Date:** 2026-06-14

**Status:** ⏳ Stuck ✅ Solved

---

## Connection

```bash
ssh bandit4@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored in the only human-readable file in the **inhere** directory. Tip: if your terminal is messed up, try the “reset” command.

---

## Commands / Solution

```bash
# Working commands used to solve the level
ls, cd, cat, file

file -h file-name # -h for human redable detials
file -h *  # for all files in dir 
file -h ./-* # for all files starting with '-' in dir
file -h ./file-number-* # for all files starting with file-number' in dir
```

---

## Key Learnings

- Main concept learned:
	`file` can be used to mass analyse files without opening them, tells file type and helps find files of interest quickly.
- Important flags / tricks:
	`-h`, `*`
- Common mistake to avoid:
	Ran `*` directly but files names were of type `-file*`, this command failed due to the queer file names starting with `-`, this needs to be resolved with reference to current directory as `./-*`.

---

## Password for Next Level

```text
4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw
```

---

## Notes / Tips

- Extra observations
- Related commands to explore later

---

## Links

- [[Linux-Commands-Cheatsheet]]
