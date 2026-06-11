# OverTheWire Bandit Notes Setup

## Folder Structure

```text
OverTheWire/
├── Bandit/
│   ├── 00-Overview.md
│   ├── Level-00.md
│   ├── Level-01.md
│   ├── Level-02.md
│   ├── Level-03.md
│   ├── Level-04.md
│   ├── Level-05.md
│   └── ...
├── Resources/
│   └── Linux-Commands-Cheatsheet.md
└── MOCs/
    └── Bandit-MOC.md
```

---

# Bandit Level Template

Save this as the template for every Bandit level.

````markdown
# Bandit Level XX → YY

**Date:** YYYY-MM-DD

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

ls -la
cat filename
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

---

# Example: Level 00 → 01

````markdown
# Bandit Level 00 → 01

**Date:** 2026-06-11

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
```

Password:

```text
bandit0
```

---

## Level Goal

The password for the next level is stored in a file called `readme` located in the home directory.

---

## Commands / Solution

```bash
ls
cat readme
```

---

## Key Learnings

- Basic file listing using `ls`
    
- Reading file contents using `cat`
    
- Introduction to password retrieval from files
    

---

## Password for Next Level

```text
boJ9jbbUNNfkqSwhW4uM4YJ5M6Y7wP
```

---

## Notes / Tips

- Always start with `ls`.
    
- Use `cat` for small text files.

````



---

# Example: Level 01 → 02

````markdown
# Bandit Level 01 → 02

**Date:** 2026-06-11

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit1@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored in a file called `-` located in the home directory.

---

## Commands / Solution

```bash
ls -a
cat ./-
```

Alternative:

```bash
cat < -
```

---

## Key Learnings

- Filenames beginning with `-` can be interpreted as command options.
    
- Prefix with `./` to explicitly reference the file.
    

---

## Password for Next Level

```text
CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9
```

---

## Notes / Tips

- `./` means "current directory".
    
- Useful whenever filenames contain special characters.
    

````

---

# Example: Level 02 → 03

````markdown
# Bandit Level 02 → 03

**Date:** 2026-06-11

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit2@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored in a file called:

`spaces in this filename`

---

## Commands / Solution

```bash
cat "spaces in this filename"
```

Alternative:

```bash
cat 'spaces in this filename'
```

---

## Key Learnings

- Spaces separate command arguments.
    
- Quoting prevents the shell from splitting the filename.
    

---

## Password for Next Level

```text
UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK
```

---

## Notes / Tips

- Master quoting early—it appears everywhere in Linux.
    

````

---

# Example: Level 03 → 04

````markdown
# Bandit Level 03 → 04

**Date:** 2026-06-11

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit3@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password is stored in a hidden file inside the `inhere` directory.

---

## Commands / Solution

```bash
cd inhere
ls -la
cat .hidden
```

---

## Key Learnings

- Hidden files begin with `.`
    
- Use `ls -a` or `ls -la` to display them.
    

---

## Password for Next Level

```text
pIwrPrtPN36QITSp3EQaw936yaFoFgAB
```

---

## Notes / Tips

- Many Linux configuration files are hidden.
    

````

---

# Example: Level 04 → 05

````markdown
# Bandit Level 04 → 05

**Date:** 2026-06-11

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit4@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password is stored in the only human-readable file in the `inhere` directory.

---

## Commands / Solution

```bash
cd inhere
file ./*
```

Find the readable file and then:

```bash
cat ./-file07
```

---

## Key Learnings

- The `file` command identifies file types.
    
- Useful for distinguishing text files from binary data.
    

---

## Password for Next Level

```text
koReBOKuIDDepwhWk7jZC0RTdopnAYKh
```

---

## Notes / Tips

- `file` and `grep` are often used together:
    

```bash
file ./* | grep ASCII
```
````


---
