# Bandit Level 08 → 09

**Date:** 19-06-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit8@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored in the file **data.txt** and is the only line of text that occurs only once.

---

## Commands / Solution

```bash
# Working commands used to solve the level
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

sort data.txt
sort data.txt | uniq -u
```

---

## Key Learnings

- Main concept learned:
	What gives unique lines in text, moreover with only one occurrence.
	One way is to print all unique - all dupes
	Have to learn about the suggested commands and reading material.
	Reading `man uniq` and ChatGPT tells that `uniq` only flags/removes adjacent duplicates
	>`banana \n apple \n banana`
	>for the above text, `uniq` will return
	>`"banana \n apple \n banana"`
	>because the repetition isn't adjacent to each other.
	
	What brings such items adjacent?: *Sorting*
	`sort` is used to sort data.
	Let's `sort data.txt` and then run `uniq`
	`sort data.txt` prints sorted `data.txt`
	Piping `sort data.txt | uniq` prints one copy of each distinct line after sorting..
	
	There is still no clue as to which one of these unique lines appeared exactly once.
	
	If `uniq` can remove duplicates, does it have an option that can _count_ them?
	`uniq -c, --count`: prefix lines by the number of occurrences.
	
	Finally we want the command to output exactly the required line so we'll use `grep "1"`.
	`grep "1"` returns all lines that contain the text "1".
	Lets look at `man uniq` for a more elegant solution.
	
	`uniq -u, --unique`: only print unique lines
	This shall print the unique lines (only lines that occur exactly once) from the given text (sorted `data.txt`).
	
- Important flags / tricks:
	`uniq -c, -u`
	
- Common mistake to avoid:
	When a command almost solves the problem, don't immediately look for a second command. Ask, does this command have an option specifically for my use case?

---

## Password for Next Level

```text
EjmOSvuAu7sGAHqHVcBDPirRe9T03kxl
```

---

## Notes / Tips

- Extra observations
	
- Related commands to explore later
	

---

## Links

- [[Linux-Commands-Cheatsheet]]
- [Piping and Redirection](https://ryanstutorials.net/linuxtutorial/piping.php)
