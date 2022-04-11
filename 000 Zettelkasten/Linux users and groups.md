202112221311
Tags: 

# Linux users and groups
- command pinky
- root
	- UID = 0
-  sta su hostovi unutar `/etc/sudoers`
- groups
	- svaki korisnik ima **primarne** i **sekundarne** grupe
- dodavanje korisnika
	- addusr
	- passwd [korisnik] promjeniti nekog korisnika
	- usermod
		- promjena podataka korisnika
- dozvole
	- +X
	- postavlja za direktorije x dozvolu
- suid i sgid
	- pokreni programe sa ovlastima usera iliti grupe koja je vlasnik datoteke
	- oznacava se sa S na x dozvoli
	- ne impliciraju x dozvolu
		- da je ujedno i x na istom mjestu
		- bilo bi malo s
		- postavljanje
			- 5 ispred ona tri broja koja je inace sluze
				- suid
			- 3
				- sgid
	- promjena vlasnika
		- chown
		- chgrp
---
# References