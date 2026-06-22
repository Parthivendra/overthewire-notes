# Bandit Level 11 → 12

**Date:** 22-06-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit11@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored in the file **data.txt**, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions

---

## Commands / Solution

```bash
# Working commands used to solve the level
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

ls
cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
```

---

## Key Learnings

- Main concept learned:
	ROT13 is a simple letter substitution cipher that replaces a letter with the 13th letter after it in the Latin alphabet. *Special case of Caesar cipher (rot3).*
	  
	Why ROT13?: Because there are 26 letters in the basic Latin alphabet and 26 = 2 × 13, the ROT13 function is its own inverse.
	In other words, two successive applications of ROT13 restore the original text (in mathematics, this is sometimes called an involution; in cryptography, a reciprocal cipher).
	
	See: [Implementation of ROT13 and Variants](https://en.wikipedia.org/wiki/ROT13#:~:text=Implementation,edit)
	`$ tr 'A-Za-z' 'N-ZA-Mn-za-m' <<< "Pack My Box With Five Dozen Liquor Jugs"`
	
- Important flags / tricks:
	
- Common mistake to avoid:
	

---

## Password for Next Level

```text
7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
```

---

## Notes / Tips

- Extra observations
	
- Related commands to explore later
	

---

## Links

- [[Linux-Commands-Cheatsheet]]
- [Rot13 on Wikipedia](https://en.wikipedia.org/wiki/ROT13)
