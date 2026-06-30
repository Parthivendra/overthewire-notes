# Bandit Level 14 → 15

**Date:** 26-06-2026

**Status:** ✅ Solved

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

nc localhost 30000 < /etc/bandit_pass/bandit14
```

---

## Key Learnings

- Main concept learned:
	Level requires the current level password, but it was not given in the prev level, an SSH key was given.
	But, the prev level did mention the password being stored somewhere on the server and being accessible by `bandit14` (current level) only. Let's retrieve it. See: [[Level-13#^6be005|Level-13 Goal]]
	The password is stored in file `/etc/bandit_pass/bandit14`
	
	Now, we need to submit it to port 30000 on localhost, let's see how.
	
	Bandit wants us to learn about IP Addresses.
	
	Bandit wants us to learn about localhost.
	`localhost` is a hostname, referring to the current computer, reserved for loopback purposes.
	
	Bandit wants us to learn about Ports.
	Any server machine makes its services available to the Internet using numbered ports, one for each service that is available on the server. For example, if a server machine is running a Web server and an FTP server, the Web server would typically be available on port 80, and the FTP server would be available on port 21. Clients connect to a service at a specific IP address and on a specific port.
	
	Reading about `ports` sparks intuition on how we could actually submit a string on `localhost` at some port.
	`http://xxx.yyy.com:PORT`
	`http://www.example.com:8080/path/`
	
	Some conventionally used port number (not mandatory, but widely used)
			Machine
		├── Port 22  → SSH
		├── Port 80  → HTTP
		├── Port 443 → HTTPS
		├── Port 25  → SMTP
		└── Port 30000 → Some custom Bandit service
	
	
	The theory is pretty much clear, however, how to do the task is not yet clear. Let us look at the man pages of the suggested commands now.
	
	`ssh` is used for remote machine, it is not likely to be used here, in case of `localhost`.
	>No, `ssh` absolutely can connect to `localhost`
	>`ssh localhost`
	
	`telnet` is used to communicate with another host, this too is not likely to be used here, in case of `localhost`.
	>`localhost` _is_ another host in networking terms—it just resolves to the loopback interface on the same machine. So, again `telnet` can be used in this case too.
	>`telnet localhost 30000`
	
	`nc` (`netcat`) is used for just about anything under the sun involving TCP, UDP, or Unix-domain sockets, but is it useful here ?
	>Yes, `nc` will create the TCP connection which is needed to transmit the password string to the service on port `30000`.
	
	`openssl` is a cryptography toolkit implementing the Secure Sockets Layer (SSL v2/v3) and Transport Layer Security (TLS v1) network protocols and related cryptography standards required by them. This too is not likely to be used here, as we are not dealing with encrypted services (TSL/SSL).
	`s_client` is almost un-intelligible.
	`nmap` also seems useful, but how exactly ?
	>`nmap` discovers things: Is a host alive? Which ports are open? What services are running?
	>It does not send text to a service
	
	Lets explore `nc`.
	>DATA TRANSFER
       The example in the previous section can be expanded to  build  a  basic  data  transfer
       model.   Any  information  input  into  one end of the connection will be output to the
       other end, and input and output can be easily captured in order to emulate file  trans‐
       fer.
       Start by using nc to listen on a specific port, with output captured into a file:
>
>          `$ nc -l 1234 > filename.out`
 >      Using  a second machine, connect to the listening nc process, feeding it the file which is to be transferred:
> 
> 	           `$ nc -N host.example.com 1234 < filename.in`
>
>     After the file has been transferred, the connection will close automatically.
>     
>     `port`  can  be specified as a numeric port number or as a service name.  Port ranges may
       be specified as numeric port numbers of the form nn-mm.  In general, a destination port
       must be specified, unless the -U option is given.  For some options, the  value  0  re‐
       quests that the system choose a port number.

```

CLIENT/SERVER MODEL
It is quite simple to build a very basic client/server model using nc.  On one console,
start nc listening on a specific port for a connection.  For example:

             $ nc -l 1234

nc  is  now  listening on port 1234 for a connection.  On a second console (or a second machine), connect to the machine and port being listened on:

             $ nc -N 127.0.0.1 1234

There should now be a connection between the ports.  Anything typed at the second  console  will be concatenated to the first, and vice-versa.  After the connection has been set up, nc does not really care which side is being used as a ‘server’ and  which  side is  being used as a ‘client’.  The connection may be terminated using an EOF (‘^D’), as
       the -N flag was given.
```

	
- Important flags / tricks:
	`-N`: `nc` waits for `^D` as EOF character, without `-N` `nc` closes connection
	
- Common mistake to avoid:
	

---
### Main Concept Learned

- Although Level 13 authenticated using an SSH private key, the **current level's password still exists** on the Bandit machine and is accessible only to `bandit14`.
- Retrieved the password from:

```
cat /etc/bandit_pass/bandit14
```

- Instead of reading another file, this level introduces **network services**.
- The objective is to **submit the current password to a service listening on TCP port `30000` on `localhost`.**

---

### Networking Concepts

#### `localhost`

- `localhost` is a special hostname that refers to the **current machine** (loopback interface, usually `127.0.0.1`).
- Since I am already SSH'd into the Bandit server:

```
My Laptop     │ SSH     ▼Bandit Server     │ localhost
```

`localhost` refers to the **Bandit server**, **not my laptop**.

---

#### Ports

A single machine can run many independent services simultaneously.

Each service listens on a different TCP/UDP port.

Examples:

```
Machine├── 22   → SSH├── 25   → SMTP├── 80   → HTTP├── 443  → HTTPS└── 30000 → Custom Bandit service
```

Connecting to a machine requires:

```
(IP address or hostname) + Port
```

For example:

```
http://example.com:8080
```

---

### Choosing the Correct Tool

I compared the suggested commands based on **the problem they solve**, rather than memorizing them.

|Tool|Primary purpose|Suitable here?|
|---|---|---|
|`ssh`|Secure remote login|❌ No. We're not logging into another shell (although `ssh localhost` is perfectly valid).|
|`telnet`|Interactive TCP communication|Possible, but superseded by `nc`.|
|`nc` (Netcat)|Read/write data over TCP/UDP connections|✅ Exactly matches the problem.|
|`openssl s_client`|Connect to TLS/SSL encrypted services|❌ Not needed because this service is plain TCP.|
|`nmap`|Discover hosts, ports and services|❌ Inspection tool, not a communication tool.|

---

### Understanding `nc`

The most useful mental model:

```
stdin   │   ▼ nc   │TCP connection   │   ▼Server
```

and in reverse:

```
Server   │TCP connection   │   ▼ nc   │stdout
```

`nc` simply forwards bytes between standard input/output and a network socket.

It **does not care** whether its input comes from:

- the keyboard
- a file
- another program through a pipe

This is classic Unix stream philosophy.

---

### Solving the Level

Instead of typing the password manually:

```
nc localhost 30000 < /etc/bandit_pass/bandit14
```

Input redirection (`<`) feeds the password file into **stdin**, and `nc` sends those bytes to the listening service.

The service validates the password and returns:

```
Correct!<next password>
```

---

### About `-N`

The OpenBSD `nc` man page demonstrates using `-N` so that after EOF is received on **stdin**, the sending side of the TCP connection is shut down.

For this Bandit level, input redirection from the password file was sufficient, so `-N` was not required.

---

### Important flags / tricks

- `< file` → Feed a file into a program's **stdin**.
- `-l` → Listen for incoming connections (server mode).
- `host port` → Connect to a TCP service (client mode).

---

### Common mistakes

- Thinking `localhost` refers to your own laptop after SSH'ing into another machine.
- Using `-l` when the service is **already listening**.
- Choosing commands by name instead of by the problem they solve.
- Forgetting that `nc` works entirely through **stdin**, **stdout**, and network sockets.

---

## Password for Next Level

```text
pbLYuZtTg4MgaqfJx8jbA9gKKGqM68A7
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
