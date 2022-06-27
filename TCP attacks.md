---
alias: ""
theme: ""
edited: 2022-06-26
---
# TCP attacks
## TCP SYN flood attack
- after receiving the SYN flag the server reserves resources
- the connection is in a half open state
	- there is a limit to this and time duration
	- new requests won't be able to be made
- the attacker must use an address from which an answer won't arrive
	- a computer that gets SYN+ACK, and didn't send a SYN, replies with RST
- the state using `netstat` will be `SYN_RCVD`
---
# References