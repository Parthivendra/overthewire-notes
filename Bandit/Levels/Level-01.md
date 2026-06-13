# Bandit Level 01 → 02

**Date:** 13-06-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit1@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored in a file called **-** located in the home directory

---

## Commands / Solution

```bash
# Working commands used to solve the level

ls -la
cat filename

file ./-
cat ./-
```

---

## Key Learnings

- Main concept learned:
    Same as [[Level-00-> 01|Level-]]
- Important flags / tricks:
    For queer file names `-`, resolve them with reference to the root folder `./-`.
- Common mistake to avoid:
    

---

## Password for Next Level

```text
263JGJPfgU6LtdEvgfWU1XP5yac29mFx
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
    

