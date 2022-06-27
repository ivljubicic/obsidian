---
alias: ""
theme: ""
edited: 2022-06-26
---
# IPv4 vulnerabilities
- **the data** that is send **isn't protected in any way**

## IP spoofing
- slanje IP datagrama s laznom adresom posiljatelja
	- DDoS attacks
### IP spoofing mitigation
- encryption of the whole data channel
- filtering false source IP addresses
	- forwarding only packets that belong to a range of IP address
	- mitigating false representation of **private IP addresses** ![[Pasted image 20220626174725.png]]
	- someone connected on router 3 knows that no traffic can come from source address 12.0.0.0/8

## IP fragmentation
- sending a huge ass datagram bigger than 65535 octets


---
# References