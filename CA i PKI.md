---
alias: ""
theme: "srs", "faks"
edited: 2022-06-26
---
# CA i PKI
- certificate authority and public key infrastructure

## PKI
- verifies the owners of private keys
- if a PKI didn't exist encryption would we vulnerable to MitM attacks
	- a MitM would intercept a message and send a different public key to the receiver
	- which he would be able to decrypt using his newly generated private key

## CA
- an authority that **signs and gives out certificates**
	- all popular authorities are automatically embedded in an operating system or browser
- the green lock of HTTPS
- if the certificate is on the list of **trusted CAs** the lock turns green
---
# References