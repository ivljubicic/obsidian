---
alias: ""
theme: ""
edited: 2022-06-26
---
# TLS protocol
- pretpostavke su da su krajnje tocke sigurne
	- napadac ima kontrolu na sve izmedju njih
- na TCP/IP stacku se nalazi izmedju aplikacijskog i transportnog sloja
## Applications that use TLS
- HTTPS 443
- SMTP 25

## HTTPS
- klijent trazi protokol https
	- inicira handshake koristenjem protokola "record"
- prvi dio sluzi da potvrdimo da je server taj koji kaze da je
	- klijent provjerava certifikat koji mu je server dostavio
- klijent se moze autentificirati serveru
### Presretanje prometa
- u tvrtkama je problematicno da je kriptiran promet

---
# References