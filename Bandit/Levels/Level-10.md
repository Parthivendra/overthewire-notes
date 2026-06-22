# Bandit Level 10 → 11

**Date:** 20-06-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit10@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored in the file **data.txt**, which contains base64 encoded data

---

## Commands / Solution

```bash
# Working commands used to solve the level
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

ls
base64 -d data.txt
```

---

## Key Learnings

- Main concept learned:
	Base64 is a binary-to-text encoding that uses 64 printable characters to represent each 6-bit segment of a sequence of byte values.
	Base64 encoding enables transmitting binary data on a communication channel that only supports text.
	
	`base64`: Base64 encode or decode FILE, or standard input, to standard output.
	
- Important flags / tricks:
	`base64 -d, --decode`: decode data
	`base 64 -i, --ignore-garbage`: when decoding, ignore non-alphabet characters
	
- Common mistake to avoid:
	

---

## Password for Next Level

```text
dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr
```

---

## Notes / Tips

- Extra observations
	
- Related commands to explore later
	

---

## Links

- [[Linux-Commands-Cheatsheet]]
- [Base64 on Wikipedia](https://en.wikipedia.org/wiki/Base64)
