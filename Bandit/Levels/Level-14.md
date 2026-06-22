# Bandit Level 14 → 15

**Date:** 22-06-2026

**Status:** ⏳ Stuck / ✅ Solved

---

## Connection

```bash
ssh -i ~/sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level can be retrieved by submitting the password of the current level to port 30000 on localhost.

---

## Commands / Solution

```bash
# Working commands used to solve the level
ssh, telnet, nc, openssl, s_client, nmap


```

---

## Key Learnings

- Main concept learned:
	Level requires the current level password, but it was not given in the prev level, an SSH key was given.
	But, the prev level did mention the password being stored somewhere on the server and being accessible by `bandit14` (current level) only. Let's retrieve it. See: [[Level-13#^6be005|Level-13 Goal]]
	The password is stored in file `/etc/bandit_pass/bandit14`
	
	Now, we need to submit it to port 30000 on localhost, let's see how.
	
- Important flags / tricks:
	
- Common mistake to avoid:
	

---

## Password for Next Level

```text
PastePasswordHere
```

---

## Notes / Tips

- Extra observations
	
- Related commands to explore later
	

---

## Links

- [[Linux-Commands-Cheatsheet]]
- [How the Internet works in 5 minutes (YouTube)](https://www.youtube.com/watch?v=7_LPdttKXPc) (Not completely accurate, but good enough for beginners)
- [IP Addresses](https://computer.howstuffworks.com/web-server5.htm)
- [IP Address on Wikipedia](https://en.wikipedia.org/wiki/IP_address)
- [Localhost on Wikipedia](https://en.wikipedia.org/wiki/Localhost)
- [Ports](https://computer.howstuffworks.com/web-server8.htm)
- [Port (computer networking) on Wikipedia](https://en.wikipedia.org/wiki/Port_\(computer_networking\))
