# Bandit Level 16 → 17

**Date:** 02-07-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit16@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The credentials for the next level can be retrieved by submitting the password of the current level to **a port on localhost in the range 31000 to 32000**. First find out which of these ports have a server listening on them. Then find out which of those speak SSL/TLS and which don’t. There is only 1 server that will give the next credentials, the others will simply send back to you whatever you send to it.

**Helpful note: Getting “DONE”, “RENEGOTIATING” or “KEYUPDATE”? Read the “CONNECTED COMMANDS” section in the manpage.**

---

## Commands / Solution

```bash
# Working commands used to solve the level
ssh, telnet, nc, ncat, socat, openssl, s_client, nmap, netstat, ss

man nmap

nmap localhost -p31000-32000
# nmap localhost -p -sV  # Automating list of ports to scan
nmap localhost -p31790 -sV

cat /etc/bandit_pass/banit16
openssl s_client -connect localhost:31790
openssl s_client -connect localhost:31790 -nocommands

mkdir /tmp/jabba/
touch /tmp/jabba/bandit17.key
nano /tmp/jabba/bandit17.key # Paste OpenSSL private key given by localhost:31790
chmod 600 /tmp/jabba/bandit17.key # scp doesn't allow transfter of world-readable key
exit

@My-Device:$ scp -P 2220 bandit16@bandit.labs.overthewire.org:/tmp/jabba/bandit17.key .
mv ./bandit17.key ~/.ssh/bandit17.key
chmod ~/.ssh/bandit17.key
```

---

## Key Learnings

- Main concept learned:
	A port scanner is an application designed to probe a server or host for open ports. Such an application may be used by administrators to verify security policies of their networks and by attackers to identify network services running on a host and exploit vulnerabilities.
	
	Previous reading tells us that `netcat` could be used here, lets verify.
	>Turns out it isn't `netcat`, but `nmap`
	>`nc` **is** capable of scanning ports (with `-z` on many implementations). It just isn't the _best_ tool here.
	>Although `nc` can probe ports, `nmap` is purpose-built for host and port discovery, making it the appropriate tool for this level.
	
	`nmap`:  It was designed to rapidly scan large networks
	Given, port range 31000 to 32000.
	Find, which port/ports are listening.
	
	Under scan techniques in `man nmap` we see `-p` to scan specified port ranges, this could be helpful.
	`$ nmap -p31000-32000`: WARNING: No targets were specified, so 0 hosts scanned.
	It seems we need to specify host(target from client side), which in this case is `localhost`, what is the syntax?
	
	`$ nmap localhost -p31000-32000`: Successful
	5 ports are open in the given range, 996 are closed. All 5 of these ports have service unknown. We need to find out which one of these has an SSL/TLS service as per Bandit's instructions, lets find that out and take it from there.
	
	Open ports: 31046, 31518, 31691, 31790, 31960
	
	It seems `-sV` might be of help.
	`$nmap localhost -p31046 -sV`: Service: echo
	`$nmap localhost -p31518 -sV`: Service: echo/ssl
	
	Maybe 31518 is the one, let's check by connecting via `openssl`. No, it just returns what we say, its an echo server. Let's probe further.
	`$nmap localhost -p31691 -sV`: Service: echo
	`$nmap localhost -p31790 -sV`: Service: ssl/unknown
	`$nmap localhost -p31960 -sV`: Service: echo
	
	Typing out the ports again per command seems redundant, there must be a better way.
	>Optimize only after identifying an actual bottleneck. For only five ports, individual scanning is perfectly reasonable. If there were 5000, then automation becomes worthwhile.
	
	`$nmap localhost -p31790 -sV` says that it couldn't recognise the service despite of it returning data, it also gives a fingerprint([[#^b81021]]). Which has words like "Wrong password! Please  enter the correct current password". It is a strong indication that this is the one.
	>`-sV` actively probes services to determine what is running. If the service is unknown, Nmap prints the observed fingerprint, which often contains valuable clues.
	
	`$openssl s_client -connect localhost:31790`
	Submitting the current level password to `read R BLOCK` we get `KEYUPDATE`. As per Bandit's instructions, we need to read `CONNECTED COMMANDS` in the man pages.
	
	Could not find `CONNECTED COMMANDS` in `man openssl, s_client, nmap`.
	Read [`CONNECTED COMMANDS`](https://docs.openssl.org/master/man1/openssl-s_client/#connected-commands-basic) from `openssl s_client` documentation.
	
	These commands are a letter which must appear at the start of a line. All further data after the initial letter on the line is ignored. The commands are listed below.
	`$openssl s_client -connect localhost:31790`
	`read R BLOCK: K kS0Hf0u5HiXFwKMKFqXvPdOTNGGa0X8V`
	
	Ohhhh! No, Bandit does not want us to interact with the `KEYUPDATE` TLS message, reading the documentation tells us *"All further data after the initial letter on the line is ignored"*, it is basically reading the password to the current level `kS0Hf0u5HiXFwKMKFqXvPdOTNGGa0X8V` which starts with a `k` and recognises it as a `KEYUPDATE` message command.
	>These are single-letter commands interpreted by `openssl s_client` **only when they appear as the first character on a new input line**. Any remaining characters on that line are ignored.
	
	We need some workaround. This quirk is similar to the `-fileName` `./-fileName` we experienced in starter levels.
	>Similar to the `./-filename` problem from the early Bandit levels, the issue is **not with the data itself, but with how the receiving program interprets the data**. In both cases, the input accidentally matches a special syntax, so we must find a way to tell the program, "Treat this as ordinary data."
	
	Using a starting blank space or quotes basically changes the input string leading to the `localhost` server saying *"Wrong!"*.
	>How can I transmit the exact password unchanged while preventing `s_client` from treating the first character as a connected command?
	
	Using `|`. No, it gives the same problem as on the previous level, the real answer is `-nocommands`.
	
	`$openssl s_client -connect localhost:31790 -nocommands`
	
	We got `Correct!`, and an OpenSSH private key. 
	We shall transfer it to our device using `scp`.
	
- Important flags / tricks:
	`-l`: Listen for an incoming connection rather than initiating a connection to a remote host.  The destination and port to listen on can be specified  either  as non-optional  arguments,  or  with  options -s and -p respectively.  Cannot be used together with -x or -z.  Additionally, any timeouts specified with the -w option are ignored.
	>Here, listening would be done by a server, not the client, so this is of no use in this scenario.
	
	`-p <port ranges>`: Only scan specified ports
	`-r`: Scan ports sequentially
	`-sV`: Probe open ports to determine service/version info.
	
	`-k`: Send a key update message to the server (TLSv1.3 only)
	`-K`: Send a key update message to the server and request one back (TLSv1.3 only)
	`-nocommands`: Disable interactive command processing.
	
- Common mistake to avoid:
	Sometimes the bytes you want to send are interpreted as commands by the program handling the communication.
	

---

## Password for Next Level

```text
pWXMAZoxGC8JmDMfmT5MGEsobMM3vnj2
```

---

## Notes / Tips

- Extra observations
```
Target known?
        │
        ├── No
        │      │
        │      ▼
        │   nmap
        │
        ▼
Service identified
        │
        ├── Plain TCP → nc
        │
        ├── TLS → openssl s_client
        │
        └── SSH → ssh
```


- Related commands to explore later
	
- `$nmap localhost -p31790 -sV` fingerprint ^b81021
```
SF-Port31790-TCP:V=7.98%T=SSL%I=7%D=7/9%Time=6A4FD28E%P=x86_64-pc-linux-gn
SF:u%r(GenericLines,32,"Wrong!\x20Please\x20enter\x20the\x20correct\x20cur
SF:rent\x20password\.\n")%r(GetRequest,32,"Wrong!\x20Please\x20enter\x20th
SF:e\x20correct\x20current\x20password\.\n")%r(HTTPOptions,32,"Wrong!\x20P
SF:lease\x20enter\x20the\x20correct\x20current\x20password\.\n")%r(RTSPReq
SF:uest,32,"Wrong!\x20Please\x20enter\x20the\x20correct\x20current\x20pass
SF:word\.\n")%r(Help,32,"Wrong!\x20Please\x20enter\x20the\x20correct\x20cu
SF:rrent\x20password\.\n")%r(FourOhFourRequest,32,"Wrong!\x20Please\x20ent
SF:er\x20the\x20correct\x20current\x20password\.\n")%r(LPDString,32,"Wrong
SF:!\x20Please\x20enter\x20the\x20correct\x20current\x20password\.\n")%r(S
SF:IPOptions,32,"Wrong!\x20Please\x20enter\x20the\x20correct\x20current\x2
SF:0password\.\n");
```


---

## Links

- [[Linux-Commands-Cheatsheet]]
- [Port scanner on Wikipedia](https://en.wikipedia.org/wiki/Port_scanner)
- [Connected Commands](https://docs.openssl.org/master/man1/openssl-s_client/#connected-commands-basic)
