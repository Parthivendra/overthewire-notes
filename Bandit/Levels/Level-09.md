# Bandit Level 09 → 10

**Date:** 20-06-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit9@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored in the file **data.txt** in one of the few human-readable strings, preceded by several ‘=’ characters.

---

## Commands / Solution

```bash
# Working commands used to solve the level
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

strings data.txt # printable chars
strings data.txt | grep -E "=+" # matches RegEx +ve closure "=": =, ==, ===, ...
strings data.txt | grep "==" # matches 2 or more "=", simpler, gets the work done
```

---

## Key Learnings

- Main concept learned:
	` grep -e "=*" data.txt -> grep: data.txt: binary file matches`
	The designated file is a binary file, maybe `strings` is helpful.
	Not all characters in a file are printable, especially with binary files.
	
	`strings` - print the sequences of printable characters in files
	Now, we need to extract the password next to multiple "=", we can use `grep` for this.
	Running `strings data.txt` we see that `grep "=="` will suffice, also because it directly matches the clue.
	
	However, to be more precise (which is to be unnecessarily verbose and complex) we could use regular expressions, specifically the positive closure, "=+".
	
	`cat` → read file contents
	`strings` → extract readable text from binary data
	
- Important flags / tricks:
  `grep -e`: Basic Regular Expression, BRE
  `grep -E`: Basic Regular Expression, ERE
	
- Common mistake to avoid:
  `strings data.txt | grep -e "=+"`: grep does not treat "+" as special regex character as it uses BRE, use `grep -E` for ERE.
	

---

## Password for Next Level

```text
FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
```

---

## Notes / Tips

- Extra observations
	
- Related commands to explore later
	

---

## Links

- [[Linux-Commands-Cheatsheet]]
