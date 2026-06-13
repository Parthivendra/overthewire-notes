# Bandit Level 00 → 01

**Date:** 13-06-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored in a file called **readme** located in the home directory. Use this password to log into bandit1 using SSH. Whenever you find a password for a level, use SSH (on port 2220) to log into that level and continue the game.

---

## Commands / Solution

```bash
# Working commands used to solve the level

# Navigation and basic file inspection
ls , cd , cat , file , du , find
```

---

## Key Learnings

- Main concept learned:
    `ls` - list items in dir
    `cd` - change dir
    `cat` - display file content in terminal
    `file` - identify what kind of file something is
    `du` - show disk usage
    `find` - search for dir based on name, size, owner, or permission.
    
- Important flags / tricks:
    `data.txt` -> one may think this is a text file, `file data.txt` may output `gzip compressed data`. `find` helps smartly despite misleading filenames.
    
    `du -h file.txt` gives file size and is useful to analyse file contents/usefulness without opening and reading file.
    
- Common mistake to avoid:

---

## Password for Next Level

```text
ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If
```

---

## Notes / Tips

- Extra observations
    
- Related commands to explore later
    

---

## Links

- [[Linux-Commands-Cheatsheet]]
    
- [[Bandit Level Previous]]
    
- [[Bandit Level Next]]
    

