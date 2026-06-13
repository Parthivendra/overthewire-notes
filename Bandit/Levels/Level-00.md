# Bandit Level 0

**Date:** 13-06-2026

**Status:** ✅ Solved 

---

## Connection

```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The goal of this level is for you to log into the game using SSH. The host to which you need to connect is **bandit.labs.overthewire.org**, on port 2220. The username is **bandit0** and the password is **bandit0**. Once logged in, go to the [Level 1](https://overthewire.org/wargames/bandit/bandit1.html) page to find out how to beat Level 1.

---

## Commands / Solution

```bash
# Working commands used to solve the level
ssh 

# Using custom port, other than default 22

sudo ufw status # ubuntu
sudo ufw allow XXXX # port no. of choice

```

---

## Key Learnings

- Main concept learned:
    `ssh` (SSH client) is a program for logging into a remote machine and for executing commands on a remote machine. It is intended to provide secure encrypted communications between two untrusted hosts over an insecure network
	
	A remote host (destination) identifies itself as `[user@]hostname` or using URI `ssh://[user@]hostname[:port]`, user proves identity using several methods, generally userid and password.
	
	Default ssh port is `22`.
- Important flags / tricks:
    
- Common mistake to avoid:
    

---

## Password for Next Level

```text
bandit0
```

---

## Notes / Tips

- Extra observations
    Glory to [Tatu Ylönen](https://en.wikipedia.org/wiki/Tatu_Yl%C3%B6nen "Tatu Ylönen")
- Related commands to explore later
    Explore Related Links

---

## Links

- [[Linux-Commands-Cheatsheet]]
    
- [SSH to Port Other Than 22](https://itsfoss.com/ssh-to-port/)

- [[Bandit Level Previous]]
    
- [[Bandit Level Next]]
    

