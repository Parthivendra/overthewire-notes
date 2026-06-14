# OverTheWire Notes Setup

## Philosophy

The goal of this vault is **not merely to record passwords**, but to build a personal knowledge base while progressing through OverTheWire wargames.

Each level note should answer:

1. What was the challenge?
2. How was it solved?
3. What was learned?
4. What should Future Me remember?

The notes are intended to be a curated memory, not a complete terminal transcript.

---

# Special Case: Level-00 Bootstrap Convention

Every OverTheWire wargame begins with a bootstrap phase:

* Learning how to access the game
* Understanding authentication
* Understanding the environment
* Solving the first challenge

Because of this, `Level-00.md` is treated as a **special note**.

For each wargame:

```text
Level-00.md
├── Wargame Level 0
└── Wargame Level 00 → 01
```

Example:

```text
Bandit/Levels/Level-00.md
├── Bandit Level 0
└── Bandit Level 00 → 01
```

Where:

### Bandit Level 0

Documents:

* SSH access
* Login credentials
* Host information
* Port information
* Any setup-related learning

### Bandit Level 00 → 01

Documents:

* The first actual puzzle
* Commands used
* Password retrieved
* Lessons learned

After this bootstrap note, all subsequent notes follow the normal convention:

```text
Level-01.md → Bandit Level 01 → 02
Level-02.md → Bandit Level 02 → 03
Level-03.md → Bandit Level 03 → 04
...
```

This convention applies to all future OverTheWire wargames unless a game's structure makes a different approach more suitable.

---

# Folder Structure

```text
OverTheWire/
├── Bandit/
│   ├── 00-Overview.md
│   ├── Assets/
│   └── Levels/
│       ├── Level-00.md
│       ├── Level-01.md
│       ├── Level-02.md
│       └── ...
│
├── Natas/
├── Leviathan/
├── Krypton/
├── Narnia/
├── Behemoth/
├── Utumno/
├── Maze/
├── Manpage/
├── Drifter/
│
├── Resources/
│   ├── Linux-Commands-Cheatsheet.md
│   ├── SSH.md
│   ├── File-Permissions.md
│   ├── Bash-Redirection.md
│   └── Grep-Find.md
│
├── Templates/
│   └── Bandit-Level-Template.md
│
├── MOCs/
│   ├── OverTheWire-MOC.md
│   ├── Bandit-MOC.md
│   └── ...
│
└── scripts/
    └── new-level.sh
```

---

# Standard Level Template

Save this as the template for all non-bootstrap levels.

````markdown
# Bandit Level XX → YY

**Date:** DD-MM-YYYY

**Status:** ✅ Solved / ⏳ Stuck

---

## Connection

```bash
ssh banditXX@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

Paste the official level description here.

---

## Commands / Solution

```bash
# Working commands used to solve the level
```

---

## Key Learnings

- Main concept learned:
- Important flags / tricks:
- Common mistake to avoid:

---

## Password for Next Level

```text
paste-password-here
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
````
