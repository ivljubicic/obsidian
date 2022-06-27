# SRS 4. labaratorijska vježba
- follow TCP stream za TELNET ![[Pasted image 20220605130855.png]]
- follow TCP stream za SSH ![[Pasted image 20220605130933.png]]

- dodajte “anti-spoofing” pravila
	- sprijeciti pakete koji dolaze na sucelje eth0 da imaju IP adresu DMZ-a ili LAN-a
- računala iz lokalne mreže (LAN) imaju neograničeni pristup poslužiteljima u DMZ i Internetu
	- `iptables -A FORWARD -i eth1 -m state --state NEW -j ACCEPT`
	- propustiti cemo sav promet koji dolazi iz LAN-a pomoću `-i eth1` zastavice
	- zastavica `--state NEW` oznacava da su paketi tek kreirani
	- pomocu `-j ACCEPT` oznacavamo da takve pakete prihvacamo
- iz vanjske mreže (Interneta) dozvoljen je pristup poslužitelju server `u DMZ korištenjem protokola SSH (tcp port 22)
	- propustamo sve pakete koji imaju izvorište iz subneta `192.0.2.0/24` i koji idu prema serveru tj `-d 203.0.113.10` na port 22 `--dport 22`
	- isto tako za port 53 i `-p udp` i `-p tcp``
- pristup iz vanjske mreže u lokalnu LAN mrežu je zabranjen
	- isti postupak kao za ranije pakete
	- signaliziramo sa `-j DROP` da takvu vrstu paketa želimo odbaciti
- s poslužitelja server je dozvoljen pristup DNS poslužiteljima u Internetu (UDP i TCP port 53)
	- `-d 192.0.2.0/24` tu stavljamo subnet internet kao odredište, a kao izvorišni port postvljamo 53 ` --sport 53`
- SSH pristup vatrozidu firewall je dozvoljen samo s računala admin (LAN)
	- sa `-A INPUT` naznačujemo da želimo filtirati pakete koju su baš namijenjeni za router

```bash 
#! /bin/sh

IPT=/sbin/iptables

  

$IPT -P INPUT DROP

$IPT -P OUTPUT DROP

$IPT -P FORWARD DROP

  

$IPT -F INPUT

$IPT -F OUTPUT

$IPT -F FORWARD

  

$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

$IPT -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

$IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

  

#

# za potrebe testiranja dozvoljen je ICMP (ping i sve ostalo)

#

$IPT -A INPUT -p icmp -j ACCEPT

$IPT -A FORWARD -p icmp -j ACCEPT

$IPT -A OUTPUT -p icmp -j ACCEPT

  
  

# ================ Dodajte ili modificirajte pravila na oznacenim mjestima #

# "anti spoofing" (eth0)

#

$IPT -A INPUT -i eth0 -s 203.0.113.0/24 -m state --state NEW -j DROP

$IPT -A INPUT -i eth0 -s 10.0.0.0/24 -m state --state NEW -j DROP

#

# <--- Dodajte ili modificirajte pravila

  

#

# racunala iz lokalne mreze (LAN) imaju neograniceni pristup posluziteljima u DMZ i Internetu

#

# <--- Dodajte pravila

$IPT -A FORWARD -i eth1 -o eth0 -m state --state NEW,ESTABLISHED -j ACCEPT

$IPT -A FORWARD -i eth1 -o eth2 -m state --state NEW,ESTABLISHED -j ACCEPT

#

# iz vanjske mreze (Interneta) dozvoljen je pristup posluzitelju server u DMZ korištenjem

# protokola SSH (tcp port 22) i DNS (udp i tcp port 53)

#

# <--- Dodajte pravila

$IPT -A FORWARD -p tcp -m tcp -s 192.0.2.0/24 -d 203.0.113.10 --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

$IPT -A FORWARD -i eth0 -o eth2 -p udp --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT

$IPT -A FORWARD -i eth0 -o eth2 -p tcp --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT

  

#

# pristup iz vanjske mreze i DMZ u lokalnu LAN mrezu je zabranjen, dozvoljen je samo

# pristup posluzitelju host (u LAN-u) s posluzitelja server (u DMZ) korištenjem protokola SSH

#

# <--- Dodajte pravila

$IPT -A FORWARD -i eth0 -o eth1 -m state --state NEW -j DROP

$IPT -A FORWARD -p tcp -m tcp -s 203.0.113.10 -d 10.0.0.11 --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

  

#

# s posluzitelja ---
alias: ""
theme: ""
edited: 2022-06-27
---
# srs 4 lab

---
# Referencesm u Internetu (UDP i TCP port 53)

#

# <--- Dodajte pravila

$IPT -A FORWARD -p tcp -m tcp -s 203.0.113.10 -d 192.0.2.0/24 --sport 53 -m state --state NEW -j ACCEPT

$IPT -A FORWARD -p udp -m udp -s 203.0.113.10 -d 192.0.2.0/24 --sport 53 -m state --state NEW -j ACCEPT

  

#

# SSH pristup vatrozidu firewall je dozvoljen samo s računala admin (LAN)

#

# <--- Dodajte pravila

$IPT -A INPUT -p tcp -m tcp -s 10.0.0.10 -d 10.0.0.1/24 --dport 22 -m state --state NEW -j ACCEPT
```

---
## References
- [[srs_lv_4[1].pdf]]
- [studosi objasnjenje](https://fer.studosi.net/d/4128-srs-4-laboratorijska-vjezba-20202021/37)