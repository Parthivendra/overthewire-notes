# Bandit Level 15 → 16

**Date:** 30-06-2026

**Status:** ✅ Solved

---

## Connection

```bash
ssh bandit15@bandit.labs.overthewire.org -p 2220
```

---

## Level Goal

The password for the next level can be retrieved by submitting the password of the current level to **port 30001 on localhost** using SSL/TLS encryption.

**Helpful note: Getting “DONE”, “RENEGOTIATING” or “KEYUPDATE”? Read the “CONNECTED COMMANDS” section in the manpage.**

---

## Commands / Solution

```bash
# Working commands used to solve the level
ssh, telnet, nc, ncat, socat, openssl, s_client, nmap, netstat, ss

openssl s_client -connect localhost:30001 < /etc/bandit_pass/bandit15
openssl s_client -connect localhost:30001 # Read R BLOCK
openssl s_client -connect localhost:30001 | /etc/bandit_pass/bandit15
```

---

## Key Learnings

- Main concept learned:
	In the previous level we used `$ nc localhost 30000 < filePath/fileName`.
	Here, we are required to do something similar,  using SSL/TLS encryption.
	
	It is trivial to verify the existence of the password of current level at `/etc/bandit_pass/bandit15`
	
	Now, we shall read the manpages, out of the given commands, `openssl, s_client, ss` sound very similar to what we wish to accomplish. Lets look at these.
	
	OpenSSL is a cryptography toolkit implementing the Secure Sockets Layer (SSL) and Transport Layer Security (TLS) network protocols and related cryptography standards       required by them.	The openssl program is a command line program for using the various cryptography functions of OpenSSL's crypto library from the shell.
	
	We are supposed to use SSL/TLS encryption, which `openssl` provides, let us read more on the types of encryption available, how to do them, and what bandit actually expects.
	
	Ok, there are a lot of different ciphers under `-enc` used for encryption, decryption and encoding. Such as, AES-128/192/256 Cipher, Base64 Encoding, RC2/4/5 Cipher, etc. 
	Now which one does bandit want, and how to actually use the command ?
	
	Lets look at **[TLS Wiki](https://en.wikipedia.org/wiki/Transport_Layer_Security)**
	
	Transport Layer Security (TLS) is a cryptographic protocol designed to provide communications security over a computer network, such as the Internet.
	Client–server applications use the TLS protocol to communicate across a network in a way designed to prevent eavesdropping and tampering. Since applications can communicate either with or without TLS (or SSL), it is necessary for the client to request that the server set up a TLS connection.
	
	We differentiate TLS (or SSL) connections using different port numbers, such as port 80 is typically used for unencrypted HTTP traffic, whereas port 443 is used for encrypted HTTPS traffic.
	
	The protocols use a handshake with an asymmetric cipher to establish not only cipher settings but also a session-specific shared key with which further communication is encrypted using a symmetric cipher.
	
	Could not find any direct uses of `openssl` on TLS Wiki and OpenSSL Wiki. Level desc suggested "CONNECTED COMMANDS", maybe that is clue.
	
	Let's look at `man nc` in hope to find the use of `openssl` in `nc`.
	TLS or SSL not listed in `man nc`. 
	If `nc` is plain TCP client, what is TLS equivalent ? `s_client` looks like a strong prospect.
	
	`openssl cmd -help | [-option | -option arg] ... [arg] ...`
	This is how s_client wants us to write a command.
	
	`openssl s_client -connect localhost:30001 < /etc/bandit_pass/bandit15`
	OpenSSL prints out its own details, says DONE and that's it. 
	
	The same happened in `nc`, without the `-N` flag, the connection automatically closes after file transfer, it does not allow the other side to respond. Which is what happens here, `openssl` submits file to `localhost` and then says I'm DONE. Whereas, we need localhost to respond, so we need something similar to `nc`'s `-N` to close connection at our will.
	>The client reaches EOF on stdin and terminates the session before you get a chance to interact further with the server.
	
	Is there a flag that tells `s_client` **not** to exit just because stdin has reached EOF?
	No such listings in the man pages.
	
	This done must be given by `openssl` not Bandit.
	Submitting a file through `openssl` warrants it close connection after transfer. What if we don't submit the file, but just open the connection.
	
	`openssl s_client -connect localhost:30001`
	
	We get `openssl` information (TCP connection, TLS handshake, OpenSSL diagnostic), and a `Read R BLOCK`, this seems to be a input for `localhost:30001` over encrypted TLS connection.
	> The TLS session is established, and I'm blocked waiting to read or write encrypted application data.
	
	Paste the password here and we get, Correct!
	
	But why didn't `... < filePath/fileName` work ? 
	This does two things:
	1. Feeds the password into `openssl`.
	2. Immediately reaches **EOF** on stdin because the file has ended.
	Once stdin reaches EOF, `openssl s_client` closes its side of the communication before you can receive the server's application-layer response. The TLS handshake succeeds, but the interaction is effectively over too quickly.
	
	> A program's behavior may depend not only on the data it receives through stdin, but also on when stdin reaches EOF. Feeding input from a file causes EOF immediately after the file ends, whereas interactive input from the terminal keeps stdin open. Sometimes, keeping stdin open briefly (e.g., with `sleep` in a compound command) is necessary to allow a protocol exchange to complete.
	
	> We'll learn more about redirections and other xargs commands later.
	
- Important flags / tricks:
	`s_client`
	`-host, -port, -connect, -quite`
	
- Common mistake to avoid:
	`|`, `<`, `>` operators and their working.

---

## Password for Next Level

```text
kS0Hf0u5HiXFwKMKFqXvPdOTNGGa0X8V
```

---

## Notes / Tips

- Extra observations
	
- Related commands to explore later
	

---

## Links

- [[Linux-Commands-Cheatsheet]]
- [Secure Socket Layer/Transport Layer Security on Wikipedia](https://en.wikipedia.org/wiki/Transport_Layer_Security)
- [OpenSSL Cookbook - Testing with OpenSSL](https://www.feistyduck.com/library/openssl-cookbook/online/testing-with-openssl/index.html)

