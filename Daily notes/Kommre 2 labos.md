# Kommre 2 labos
## Zadatak 22.
![[Pasted image 20220513103343.png]]

### pc9
![[Pasted image 20220513103644.png]]
### pc8
![[Pasted image 20220513103707.png]]
### pc3
![[Pasted image 20220513103755.png]]
### pc4
![[Pasted image 20220513103812.png]]
### pc5
![[Pasted image 20220513103827.png]]
### pc6
![[Pasted image 20220513103844.png]]
### router2
![[Pasted image 20220513104049.png]]
### router1
![[Pasted image 20220513104119.png]]
### router3
![[Pasted image 20220513104140.png]]
## Zadatak 23
- routing tablice svih pc ostaju iste
- paketi koji udju u petlju se uniste jer exceedaju TTL
### router2
![[Pasted image 20220513112252.png]]
### router1
![[Pasted image 20220513112307.png]]
### router3
![[Pasted image 20220513112326.png]]
## Zadatak 24
![[Pasted image 20220513113723.png]]
- prvotno se razlikuju
	- pinganje servera sa pc-a TTL=60, a kasnije kada RIP shvati da ima brzi put onda bude TTL=61
		- paketi idu prvo u smjeru router3, a onda kasnije u smjeru router7
	- pinganje pc-a sa servera TTL=61
		- paketi idu preko router7 
## Zadatak 25
![[Pasted image 20220513120312.png]]
- IP adrese oznacavaju mrezu do koje trebamo doci, a metric oznacava koliko skokova trebamo napraviti do nje, tj koliko routera trebamo proci
## Zadatak 28
- prvo sam iskorstio alat `nmap` na racunalu da provjerim koji su TCP portovi otvoreni, a to je bio port 111
- onda sam na pc2 terminalu izvrsio naredbu `nc 10.0.8.10 111`
![[Pasted image 20220513121512.png]]
- a. uspostava i raskid veze 
	- Uspostava veze
		1. PC salje paket na server sa SYN=1
		2. server salje na PC odgovar sa SYN=1 i ACK=1
		3. PC salje na server ACK=1
			- potvrduje da je server potvrdio da se uspostavila veza
		4. komunikacija moze krenuti
	- Raskidanje veze
		1. server salje na PC postavljenje zasatvice FIN i ACK
		2. pc odgovara sa postavljenim ACK flagom
- b. izvorisna IP adresa, vrata, odredisna IP adresa i odresidna vrata uvijek ostaju isti
- c. upostava i raskid izgledaju isto
	1. uspostava
	2. salje se paket sa ACK i PSH flagom
		- PSH flag govori da transportni sloj ceka aplikacijski da se posalje dovoljno podataka da bude jednako MTU
	3. server odgovara sa ACK flagom koji je jednak do sad poslanoj velicini paketa
	4. ponavljaj korake 2. i 3. sve dok se paket ne posalje, povecava se `seq` broj za koliko je bio `len` prijasnjeg paketa
	5. pc salje FIN flag da sugerira da je poslan paket do kraja, sa len=0
	6. server salje ACK zastavicu
- d. potvrde sluze tome da znamo koliko je paketa poslano
- e. kod uspostave veze i kada se paketi salju je velicina prozora 65535, a kada se samo salju zastavice je velicina prozora 1026
## Zadatak 29
- dva procesa ne mogu u isto vrijeme slusati na istim vratima kada se koristi protokol TCP
## Zadatak 30
- isto vrijedi za protokol UDP, ne mogu na istim vratima slusati dva procesa
## Zadatak 31
- Oba protokola, i UPD i TCP sluze za prijenos paketa izmedju mreza i salju ih preko portova. Samo se razlikuju u tome kako ostvaruju taj prijenos, TCP je sporiji ali nema gubitka paketa, a UDP je brzi a moze doci do gubitka
## Zadatak 32
- uzrok gubitka paketa moze biti prevelika zauzetost mreze
- svaki put kada server posalje paket zapocne `Retransmission timer for Segment`, ako ne dobije ACK packet i taj timer istekne, server salje taj paket ponovno
- ne znam kako da bi uzrokovali gubitak paketa bez mijenjanja karakteristika poveznice mreze
## Zadatak 33
- Prilikom gubitka segmenta, potvrde se iznova salju, a velicina prozora ostaje ista.
---
# References
- https://www.fer.unizg.hr/_download/repository/Internetski_protokoli_u_primjeni.pdf
- https://www.geeksforgeeks.org/tcp-flags/
- https://www.geeksforgeeks.org/routing-information-protocol-rip/
- https://accedian.com/blog/network-packet-loss-retransmissions-and-duplicate-acknowledgements/
- https://wiki.wireshark.org/TCP_Analyze_Sequence_Numbers