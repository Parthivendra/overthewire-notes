# Bandit Level 12 → 13

**Date:** 22-06-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit12@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored in the file **data.txt**, which is a hexdump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under /tmp in which you can work. Use mkdir with a hard to guess directory name. Or better, use the command “mktemp -d”. Then copy the datafile using cp, and rename it using mv (read the manpages!)

---

## Commands / Solution

```bash
# Working commands used to solve the level
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd, mkdir, cp, mv, file

xxd - make a hex dump or do the reverse
```

---

## Key Learnings

- Main concept learned:  
    A hexdump is a textual hexadecimal representation of binary data. It is commonly used in debugging, reverse engineering, and digital forensics.
    
    `data.txt` was not the actual file; it was a hexdump of the actual file.
    
    `xxd -r` can reverse a hexdump back into its original binary form.
    
    When working with unknown data, use an investigation workflow:
    
    ```text
    file
    ↓
    identify format
    ↓
    use appropriate tool
    ↓
    file
    ↓
    identify next format
    ```
    
    Instead of guessing commands, let the file tell you what it is.
    
    Level 12 introduced the idea of peeling layers from a file:
    
    ```text
    hexdump
    ↓
    binary
    ↓
    compressed/archive format
    ↓
    decompress/extract
    ↓
    repeat
    ↓
    plain text
    ```
    
    Tar archives are not compressed files. A tar archive is a container that bundles files together. It must be extracted, not decompressed.
    
- Important flags / tricks:
    
    `xxd -r`  
    : Reverse a hexdump back into binary data.
    
    `file <filename>`  
    : Identify the type of a file.
    
    `gzip -d <file.gz>`  
    : Decompress a gzip-compressed file.
    
    `bzip2 -d <file.bz2>`  
    : Decompress a bzip2-compressed file.
    
    `tar -tf <archive.tar>`  
    : List contents of a tar archive.
    
    `tar -xf <archive.tar>`  
    : Extract contents of a tar archive.
    
    `mktemp -d`  
    : Create a temporary writable directory with a hard-to-guess name.
    
- Common mistake to avoid:
    
    Confusing a tar archive with a compressed file.
    
    ```bash
    tar -df archive.tar
    ```
    
    does **not** decompress the archive.
    
    `-d` means compare/diff.
    
    To extract files from a tar archive, use:
    
    ```bash
    tar -xf archive.tar
    ```
    
    Do not print binary data directly to the terminal.
    
    Instead of:
    
    ```bash
    xxd -r data.txt
    ```
    
    save the output to a file:
    
    ```bash
    xxd -r data.txt output.bin
    ```
    
    When stuck, do not guess the next command. Run:
    
    ```bash
    file <filename>
    ```
    
    and let the file type guide the next step.

---

## Password for Next Level

```text
qQYQiHOBPR8zR61qxYqX45quvihF2uzk
```

---

## Notes / Tips

- Extra observations
	
- Related commands to explore later
	

---

## Links

- [[Linux-Commands-Cheatsheet]]
- [Hex dump on Wikipedia](https://en.wikipedia.org/wiki/Hex_dump)
