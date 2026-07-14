# Bandit Level 18 → 19

**Date:** 10-07-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit18@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored in a file **readme** in the homedirectory. Unfortunately, someone has modified **.bashrc** to log you out when you log in with SSH.

---

## Commands / Solution

```bash
# Working commands used to solve the level
ssh, ls, cat

ssh -p bandit18@bandit.labs.overthewire.org ls
ssh -p bandit18@bandit.labs.overthewire.org cat readme

```

---

## Key Learnings

- Main concept learned:
	`man ssh`: If a command is specified, it will be executed on the remote host instead of a login shell.  A complete command line may be specified as command, or it  may  have  additional arguments.  If supplied, the arguments will be appended to the command, separated by spaces, before it is sent to the server to be executed.
	
	Bandit tells us that someone has modified the `.bashrc` to log us out when we log in with SSH. However, SSH also allows us to execute commands instead of login. Let's figure out the syntax, then try to read `.bashrc` and see what we can do.
	
	`$ssh -p 2220 bandit18@bandit.labs.overthewire.org ls`
	
	Turns out we don't need to fix `.bashrc`, we can use SSH's remote command execution feature to extract the password.
	
- Important flags / tricks:
	
- Common mistake to avoid:
	

---

## Password for Next Level

```text
KpsOfPkcP7i1FlIExk2QEjyt6dw8dxZI
```

---

## Notes / Tips

- Extra observations
	
- Related commands to explore later
	

---

## Links

- [[Linux-Commands-Cheatsheet]]
