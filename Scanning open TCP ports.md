---
alias: ""
theme: ""
edited: 2022-06-26
---
# Scanning open TCP ports
## TCP connect
- potpuni three way handshake
	- zapisuju se u logove
- poptuno spajanje se cesto biljezi u logovima

## TCP SYN
- poluotvoreno skeniranje
- SYN se salje
	- syn+ack reply znaci da aplikacija slusa i ceka uspostavu veze
	- RST znaci da ne ceka nikakva aplikacija
- ako nema odgovora
	- negdje je to filtrirano

## TCP FIN
- nista se nece zapisati u logovima
- ako nema nicega na pristupu vraca se RST
- u suporotnom se igornira zahtjev


---
# References