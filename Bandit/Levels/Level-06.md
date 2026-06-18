# Bandit Level 06 → 07

**Date:** 18-06-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit6@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored **somewhere on the server** and has all of the following properties:

- owned by user bandit7
- owned by group bandit6
- 33 bytes in size

---

## Commands / Solution

```bash
# Working commands used to solve the level
ls , cd , cat , file , du , find , grep

find . -group "bandit6" -user "bandit7" -size 33c 2>/dev/null
```

---

## Key Learnings

- Main concept learned:
    See [[PS-Inspire/OverTheWire/Bandit/Levels/Level-05|Level-05]]
    
	`command 2>/dev/null` is used to send error output (steam 2) into black hole (`/dev/null`)
- Important flags / tricks:
```
-group gname
	File belongs to group gname (numeric group ID allowed).
```
- Common mistake to avoid:
    Think: Can I make find return exactly one file?

---

## Password for Next Level

```text
morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj
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
    

