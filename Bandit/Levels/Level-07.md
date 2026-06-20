# Bandit Level 07 → 08

**Date:** 19-06-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit7@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored in the file **data.txt** next to the word **millionth**

---

## Commands / Solution

```bash
# Working commands used to solve the level

man, grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

cat data.txt | grep "millionth"
grep "millionth" data.txt # same thing but avoids UUOC
```

---

## Key Learnings

- Main concept learned:
	UUOC: Useless use of cat
	`grep pattern file` can read file, searches text for matching pattern, prints matching lines
- Important flags / tricks:
	`grep` can be piped `|` with other commands but can also read files directly.
- Common mistake to avoid:
	

---

## Password for Next Level

```text
dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
```

---

## Notes / Tips

- Extra observations
	
- Related commands to explore later
	

---

## Links

- [[Linux-Commands-Cheatsheet]]

