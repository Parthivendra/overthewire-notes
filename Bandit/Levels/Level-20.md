# Bandit Level 20 → 21

**Date:** 14-07-2026

**Status:** ⏳ Stuck / ✅ Solved

---

## Connection

```bash
ssh bandit20@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

There is a setuid binary in the homedirectory that does the following: it makes a connection to localhost on the port you specify as a commandline argument. It then reads a line of text from the connection and compares it to the password in the previous level (bandit20). If the password is correct, it will transmit the password for the next level (bandit21).

**NOTE:** Try connecting to your own network daemon to see if it works as you think

---

## Commands / Solution

```bash
# Working commands used to solve the level
ssh, nc, cat, bash, screen, tmux, Unix ‘job control’ (bg, fg, jobs, &, CTRL-Z, …)


```

---

## Key Learnings

- Main concept learned:
	
	
	
- Important flags / tricks:
	
- Common mistake to avoid:
	

---

## Password for Next Level

```text
PastePasswordHere
```

---

## Notes / Tips

- Extra observations
	
- Related commands to explore later
	

---

## Links

- [[Linux-Commands-Cheatsheet]]
