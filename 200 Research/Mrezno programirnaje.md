202203110914
Tags: 

# Mrezno programirnaje
- sistemski poziv `socket()`
- u klijentskom programu se ne poziva bind
- close oslobada resurse
- shutdown onemogucuje pisanje/citanje
- pogledati primjer 3

## Skontati sve sto se dogadja
### AF vs PF
- the most correct thing to do is to use `AF_INET` in your `struct sockaddr_in` and `PF_INET` in your call to `socket()`.

## Struktura klijenta i servera
![[Pasted image 20220527134223.png]]

---
# References