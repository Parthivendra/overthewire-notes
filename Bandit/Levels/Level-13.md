# Bandit Level 13 → 14

**Date:** 22-06-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit13@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level. Look at the commands that logged you into previous bandit levels, and find out how to use the key for this level.
If you need help with this level: a hint file can be found in the home directory.
Make sure to read the error messages as they are informative.

^6be005

---

## Commands / Solution

```bash
# Working commands used to solve the level
ssh, scp, umask, chmod, cat, nc, install

scp -P 2220 bandit13@bandit.labs.overthewire.org:~/sshkey.private ./Bandit/Levels/

chmod MODE FILE
chmod 600 ~/sshkey.private

ssh -i ~/sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
```

---
## Key Learnings

- Main concept learned:

	A password is not the only way to authenticate with SSH.

	SSH supports public-key authentication, where a private key acts as the credential instead of a password.

	The `file` command identified:

	```text
	sshkey.private: PEM RSA private key
	```

	This indicated that the file was not meant to be read or decoded; it was meant to be used by SSH.

	The `ssh` command can use a specific private key via:

	```bash
	ssh -i <private-key-file> <user>@<host> -p <port>
	```

	A private key is sensitive information and should only be accessible by its owner.

	SSH checks file permissions before using a private key and will refuse to use keys that are readable by other users.

---

- Important flags / tricks:

	`ssh -i <keyfile>`
	: Use a specific private key for authentication.

	`scp`
	: Securely copy files between local and remote systems.

	```bash
	scp -P 2220 user@host:/path/to/file .
	```

	`chmod 600 <file>`
	: Set permissions so only the owner can read and write the file.

	```text
	600 = rw-------
	```

	`ls -l`
	: View file permissions in symbolic form.

	`stat <file>`
	: View detailed file metadata including permissions.

---

- Common mistakes to avoid:

	Do not try to extract passwords from a private key file.

	A private key is itself a credential and is meant to be used directly by SSH.

	Always read SSH error messages carefully. SSH usually explains exactly why authentication failed.

	Example:

	```text
	WARNING: UNPROTECTED PRIVATE KEY FILE!
	Permissions 0755 are too open.
	This private key will be ignored.
	```

	This means the key permissions must be restricted.

	A filesystem may not support Unix permissions properly.

	In this level, the key was initially stored on a mounted filesystem where `chmod` appeared to succeed but permissions remained unchanged.

	Copying the key to the Linux home directory and then running:

	```bash
	chmod 600 sshkey.private
	```

	solved the problem.

---

### Permission Numbers

```text
r = 4
w = 2
x = 1
````

```text
7 = rwx
6 = rw-
5 = r-x
4 = r--
0 = ---
```

Common combinations:

```text
755 = rwxr-xr-x
700 = rwx------
644 = rw-r--r--
600 = rw-------
```


>*When a command appears to succeed but nothing changes,* 
>*suspect the filesystem.*

---

## Password for Next Level

```text
aaWecNkG4FhxJQxz07uiwzVP6bJiYS65
```

---

## Notes / Tips

- Extra observations
	
- Related commands to explore later
	

---

## Links

- [[Linux-Commands-Cheatsheet]]
- - [SSH/OpenSSH/Keys](https://help.ubuntu.com/community/SSH/OpenSSH/Keys)
- [Transferring Files via SCP](https://help.ubuntu.com/community/SSH/TransferFiles)

