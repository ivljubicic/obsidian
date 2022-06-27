#! /bin/sh

IPT=/sbin/iptables

$IPT -P INPUT DROP
$IPT -P OUTPUT DROP
$IPT -P FORWARD DROP

$IPT -F INPUT
$IPT -F OUTPUT
$IPT -F FORWARD

$IPT -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# 
# za potrebe testiranja dozvoljen je ICMP (ping i sve ostalo)
#
$IPT -A INPUT   -p icmp -j ACCEPT
$IPT -A FORWARD -p icmp -j ACCEPT
$IPT -A OUTPUT  -p icmp -j ACCEPT


# ================ Dodajte ili modificirajte pravila na oznacenim mjestima #
# "anti spoofing" (eth0)
#
$IPT -A INPUT   -i eth0 -s 127.0.0.0/8  -j DROP
$IPT -A FORWARD -i eth0 -s 127.0.0.0/8  -j DROP
#
# <--- Dodajte ili modificirajte pravila
$IPT -A FORWARD -i eth2 -s 127.0.0.0/8 -j DROP
$IPT -A INPUT -i eth2 -s 127.0.0.0/8 -j DROP
#
# racunala iz lokalne mreze (LAN) imaju neograniceni pristup posluziteljima u DMZ i Internetu
#
# <--- Dodajte pravila
$IPT -A FORWARD -i eth1 -o eth0 -p all -m state --state NEW -j ACCEPT 
$IPT -A FORWARD -i eth1 -o eth2 -p all -m state --state NEW -j ACCEPT 
#
# iz vanjske mreze (Interneta) dozvoljen je pristup posluzitelju server u DMZ korištenjem 
# protokola SSH (tcp port 22) i DNS (udp i tcp port 53)
#
# <--- Dodajte pravila
$IPT -A FORWARD -i eth0 -o eth2 -p tcp -m tcp --dport 22 -m state --state NEW -j ACCEPT
$IPT -A FORWARD -i eth0 -o eth2 -p tcp -m tcp --dport 53 -m state --state NEW -j ACCEPT
$IPT -A FORWARD -i eth0 -o eth2 -p udp -m udp --dport 53 -m state --state NEW -j ACCEPT
#
# pristup iz vanjske mreze i DMZ u lokalnu LAN mrezu je zabranjen, dozvoljen je samo 
# pristup posluzitelju host (u LAN-u) s posluzitelja server (u DMZ) korištenjem protokola SSH
#
# <--- Dodajte pravila
$IPT -A FORWARD -o eth1 -m state --state NEW -j DROP
$IPT -A FORWARD -d 10.0.0.11/24 -s 203.0.113.10/24 -p tcp -m tcp --dport 22 -j ACCEPT

# s posluzitelja server je dozvoljen pristup DNS posluziteljima u Internetu (UDP i TCP port 53)
#
# <--- Dodajte pravila
$IPT -A FORWARD -s 203.0.113.10/24 -p tcp -m tcp --dport 53 -o eth0 -m state --state NEW -j ACCEPT
$IPT -A FORWARD -s 203.0.113.10/24 -p udp -m udp --dport 53 -o eth0 -m state --state NEW -j ACCEPT
#
# SSH pristup vatrozidu firewall je dozvoljen samo s računala admin (LAN)
#
# <--- Dodajte pravila
$IPT -A INPUT -s 10.0.0.10/24 -i eth1 -p tcp -m tcp --dport 22 -j ACCEPT
