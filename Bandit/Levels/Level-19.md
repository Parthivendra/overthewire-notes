# Bandit Level 19 → 20

**Date:** 10-07-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit19@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

To gain access to the next level, you should use the setuid binary in the homedirectory. Execute it without arguments to find out how to use it. The password for this level can be found in the usual place (/etc/bandit_pass), after you have used the setuid binary.

---

## Commands / Solution

```bash
# Working commands used to solve the level
ls
file bandit20-do
./bandit20-do
./bandit20-do whoami
./bandit20-do cat /etc/bandit_pass/bandit20
```

---

## Key Learnings

- Main concept learned:
	In Unix-like systems, the access rights flags setuid and setgid (short for set user identity and set group identity) allow users to run an executable with the file system permissions of the executable's owner or group respectively and to change behaviour in directories. They are often used to allow users on a computer system to run programs with temporarily elevated privileges to perform a specific task. While the assumed user id or group id privileges provided are not always elevated, at a minimum they are specific.
	
	As instructed by Bandit, running `$ ./bandit20-do` tells us that this `setuid` file could be used to execute command as user `bandit20`, we are currently at level 19 and logged in as `bandit19`.
	
	From previous levels, we also know that all bandit levels have their passwords stored and accessible, only to them, at `/etc/bandit_pass/banditXX`. If we simply read this file as `bandit20` (using `bandit20-do`) we can get the password to log into `bandit20`.
	
- Important flags / tricks:
	
- Common mistake to avoid:
	

---

## Password for Next Level

```text
4pIjcunZ0fK2vmp3IwfG8Vf7VhxD6pOA
```

---

## Notes / Tips

- Extra observations
	
- Related commands to explore later
	

---

## Links

- [[Linux-Commands-Cheatsheet]]
