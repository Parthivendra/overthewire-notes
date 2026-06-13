# Bandit Level 02 → 03

**Date:** 13-06-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit2@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored in a file called `--spaces in this filename--` located in the home directory

---

## Commands / Solution

```bash
# Working commands used to solve the level

ls -la
cat filename

cat ./--spaces\ in\ this\ filename-- 
```

---

## Key Learnings

- Main concept learned:
    See [[PS-Inspire/OverTheWire/Bandit/Levels/Level-01|Level-0]]
- Important flags / tricks:
    For spaces ` ` in filenames,  or other special characters, resolve special character using `\`.
- Common mistake to avoid:
    

---

## Password for Next Level

```text
MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx
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
    

