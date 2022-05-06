# Izvjestaj 6.5
## X Server
- pokretanje preko `Xephyr -resizeable -fullscreen :2 `
	- isto potrebno u Dockeru napraviti `export DISPLAY=:2`
	- to sam dodao liniju koda u Dockerfile za to racunalo
		- `ENV DISPLAY :2`
	- podijeljen /tmp/.x11-unix
		- probao sam i bez ovoga, ali tad je izbacivalo gresku
	- moze se i window manager pokrenuti na Xepyhr, ako je potrebno, sa `DISPLAY=:2 [wm]`
		- za window manager koristim i3
- pokretanje docker imagea sa ovom kommandom `docker exec -it $(docker ps | grep implementacija_developer_senior | awk '{print $1}') bash`
	- ne moram svaki put upisivati hash conteinra nego ga mogu samo po imenu pozvati
- svaki put kada se bilo sta promjeni u Dockerfile
	- treba se iznova postaviti pomocu komande `docker-compose build`
## VNC
- posto X server nema sigurnost na prvom mjestu mogu implementirati VNC umjesto njega
	- koristio bih tigervnc
	- zasad bih ostao pri X server, pa mijenjao po potrebi
	- kljucno mi je samo provjeriti radi li komunikacija preko maila i primaju li se mailovi izvana
## Plan za dalje
- provjeriti radi li komunikacija preko maila
- za pocetak necu postavljati DNS nego rucno promjeniti /etc/hosts
- probati poslati mail poruku sa Kali Linux virtualnog racunala koji se nalazi na istom host racunalu
- krenuti sa pisanjem zavrsnog rada, trenutni kostur izgleda ovako
	1. teorijska podloga, sto su kiberneticki poligoni
	2. opis tehnologija
	3. opis sto je napravljeno za postavljanje, verzije softwera, kako je bilo postavljati
	4. opis implemetacije, opis docker composea yamla
	5. zasto je modularno napravljeno
		- da se uvede druga ranjivost
		- sloziti vise 
	6. kako rijesiti tu ranjivost koja je postavljena
	7. zakljucak
---