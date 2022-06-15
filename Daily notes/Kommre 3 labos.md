# Kommre 3 labos
## Zadatak 34 
![[Pasted image 20220524140949.png]]
Skica:
![[Pasted image 20220524151525.png]]
- DHCPDicover i Request rade broadcast, nije IP adresa DHCP server 255.255.255.255 nego je to samo naznaka da je u tom koraku napravljen broadcast sa PC3-a

## Zadatak 35
a. 7.0.0.2
b. zpmMail.zpm.fer.hr
c. www.tel.fer.hr
d. `host -a hr`: hr2.com i dnsHr.hr
e. dnsFer.fer.hr
f. dnsTel.tel.fer.hr
g. `host -a .`: aRootServer, bRootServer, RootServer
h. mm.tel.fer.hr
## Zadatak 36
![[Pasted image 20220524154433.png]]
![[Pasted image 20220524160930.png]]
- DNS poruke za izmjenjuju sa vršnim poslužiteljem jer je on default DNS za računalo
## Zadatak 37
- za razrješenje DNS šaljemo na sa proizvoljnih vrata na vrata 53 koja su dezignirana vrata za DNS
## Zadatak 38
![[Pasted image 20220524161937.png]]
- a) protokoli koju se pojavili
	- DNS - rezolucija imena, da znamo na koju IP adresu poslati nesto kada upisemo npr zpm.fer.hr
	- SMTP - slanje i primanje pošte
	- ARP - kada poznajemo IP adresu i želimo saznati MAC adresu računala
	- TCP - omogućava aplikacijama i uređajima da šalju podatke preko mreže 
	- Aplikacijski sloj - SMTP, DNS 
	- Transporni sloj - TCP
	- Mrežni sloj - ARP
- b) ![[Pasted image 20220525100707.png]]
	1. računalo mm.tel.fer.hr traži od DNS servera IP adresu od www.tel.fer.hr tj svog e-mail poslužitelja 
	2. mm stava TCP konekciju sa svojim e-mail poslužiteljem 
	3. računalo mm šalje email www.tel.fer.hr
	4. raskida se TCP veza
	5. poslužitelj www stvara TCP konekciju sa DNS serverom
	6. traži od DNS servera IP adresu od zpmMail.zpm.fer.hr tj. odredišne mail adrese
	7. uspostavljama TCP koncekciju sa zpmMail.zpm.fer.hr
	8. šalje mail koristeći SMTP na zpmMail.zpm.fer.hr
	9. raskida se TCP veza
- c) protokol DNS se u ovom slučaju koristi, i u bilokojem slučaju da bi saznali odredišnu IP adresu koja stoji iza nekog simboličkog imena
	- nadležni poslužitelj e-maila za domenu tel.fer.hr je poslužitelj www. Računalo mm IP adresu tog poslužitelja saznaje tako da pošalje DNS upit na dnsTel
	- nadležni poslužitelj e-maila za domenu zpm.fer.hr je poslužitelj zpmMail.zpm.fer.hr. Računalo www IP adresu tog poslužitelja saznaje tako da pošalje DNS upit na dnsZpm
- d) uspostavilo se dvije TCP konekcije u ovom primjeru. 
	- Jedna je konekcija između mm.tel.fer.hr i www.tel.fer.hr i koristila su se vrata 25 na poslužitelju www.tel.fer.hr. 
	- Druga konekcija je između www.tel.fer.hr i zpmMail.zpm.fer.hr i također su se koristila vrata 25 na poslužitelju zpmMail.zpm.fer.hr.
	- Obje te konekcije služe za slanje e-maila. Zato se i koriste dobro poznata SMTP vrata 25.
- e) tijek komunikacije ![[Pasted image 20220525105347.png]]
	- plavo je označen poslužitelj www.tel.fer.hr, a crveno je označen klijent mm.tel.fer.hr
	- u zadnjoj poruci od klijenta se prenosi sadržaj elektronične pošte
## Zadatak 39.
![[Pasted image 20220525110548.png]]
- a) protokoli koju se pojavili
	- Aplikacijski sloj - POP, DNS 
	- Transporni sloj - TCP
	- Mrežni sloj - ARP
- b) upostavilo se jedna TCP konekcija i koristila su se vrata 110 na poslužitelju zpmMail.zpm.fer.hr
- ![[Pasted image 20220525113514.png]]
- c) DNS se korsti da bi računalo pc dobilo IP adresu svog nadležnog poslužitelja e-maila
- d) plavo oboje je zpmMail.zpm.fer.hr, a crvene boje je ozacen pc.zpm.fer.hr ![[Pasted image 20220525113542.png]]
	- POP poruke
		- LIST
			- traži koliko ima e-mailova i njihovu veličinu
		- RETR
			- vraća e poštu
		- kod mene se može vidjeti da sam zabunom poslao dva maila i onda LIST vraća da se na serveru nalaze dva e-maila
- e) ako gledamo samo drugi recieved, poruka je stigla od mm.tel.fer.hr preko njegovog nadležnog poslužitelja www.tel.fer.hr
- f) komunikacija nije šifrirana jer možemo vidjeti komunikaciju preko wiresharka u plaintextu. Čak se i lozinka može vidjeti u plaintextu.
## Zadatak 40.
- U ovom primjeru su se uspostavile 3 HTTP konekcije tj 6, ali 3 para request i response. Jedna služi da dohvat html-a stranice, druga služi za dohvat gif-a, a treća za dohvat favicon.ico
- Transportne adrese
	- Source: 30.0.0.4:80, destination 30.0.0.3:10000
## Zadatak 41
- jedan zahtjev i jedan odgovor ![[Pasted image 20220525120800.png]]
- HTTP zahtjev, crvene boje
	- prva linija - koju metodu koristimo, u našem slučaju GET, jos moze biti npr. POST
	- druga linija - govori tko posjeduje tu datotetku kojoj pokušavamo pristupiti
	- nadalje možemo vidjeti koji browser klijent koristi
- HTTP odgovor, plave boje
	- prva linija - sadrži odgovor tj. govori o tome je li metoda prošla ili nije ili o nekim poteškoćama
	- druga linija - tip datoteke
	- nadalje možemo vidjeti koji je sadržaj datoteke koje dohvaćamo
## Zadatak 42
- skica komunikacije ![[Pasted image 20220525121950.png]]
	- pošto se HTML kod nije promjenio kada smo drugi put došli na isti link, tijelo poruke je prazno. Također nije prošlo dovoljno vremena od prijašnjeg zahtjeva da provjerimo je li se HTML kod promjenio.
	- If-modified-since
		- služi da klijent da to znanja koja je najažurnija verzija HTML koju ima kod sebe. Ako je ista kao poslužiteljeva neće se ponovno poslati ista datoteka.