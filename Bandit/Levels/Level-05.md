# Bandit Level 05 → 06

**Date:** 17-06-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit5@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored in a file somewhere under the **inhere** directory and has all of the following properties:

- human-readable
- 1033 bytes in size
- not executable

---

## Commands / Solution

```bash
# Working commands used to solve the level
ls , cd , cat , file , du , find

find . -size 1033c # Find in curr dir files that have size 1033 bytes (c)
find . -type f
find . -name "filename"
find . -user username
find . -executable # Executable files
find . ! -executable # Non executable files
find . -perm 755 # Permission bits 755 - executable
```

---

## Key Learnings

- Main concept learned:
	`find` command is used to search files/directories that match given conditions recursively.
- Important flags / tricks:
	`-name`, `-size`, `-type`, `-executable`, `-user`, `-executable`
- Common mistake to avoid:

---

## Password for Next Level

```text
pXa26xhMWaC2SvDotA4r9EgZkulOeSBW
```

---

## Notes / Tips

- Extra observations
- Related commands to explore later

---

## Links

- [[Linux-Commands-Cheatsheet]]
