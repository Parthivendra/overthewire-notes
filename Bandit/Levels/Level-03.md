# Bandit Level 03 → 04

**Date:** 13-06-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit3@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored in a hidden file in the **inhere** directory.

---

## Commands / Solution

```bash
# Working commands used to solve the level

ls -la
cat filename
```

---

## Key Learnings

- Main concept learned:
    File or dir names starting with `.` are considered hidden.
    To see hidden files uses `ls -a`, `-a` stands for all.
    `ls -a` always outputs `.` and `..`.
    `.` means current directory, `..` means parent directory.

- Important flags / tricks:
    `-a` all
    `-l` detailed info
    `-la` / `-al` show everything with details.
- Common mistake to avoid:
    

---

## Password for Next Level

```text
2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
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
    

