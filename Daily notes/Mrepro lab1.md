202205101236
Tags: 
# Mrepro lab1
## Slijed akcija
1. bot posalje udp paket REG na cnc
2. cnc salje na bot poruku MSG **prog** tj 0
	1. procitati slijedno array
3. zatim se bot javlja UDP_serveru koji se nalazi na IP adresi iz prijasnjeg koraka
	1. salje poruku HELLO
	2. ucitava poruku najvece duljine 512 znakova - payload
4. kada primi MSG **run** tj 1
	1. citati array zapis po zapis i pohranjivati u strukture
	2. maksimalno 20 zapisa moze biti
	3. na zadane adrese bot salje UDP datagrame s porukom payload
5. vrati se na cekanje poruke od CnC

## Razglabanje strukture
- prvi oktet je karakter poruke

## Slijed pokretanja
1. pokrene se UDP sa nekim payloadom
	- payload je basically neka poruka
---
# References
- https://www.fer.unizg.hr/_download/repository/Lab1-bot-2022.pdf
- https://github.com/beejjorgensen/bgnet/blob/master/examples/listener.c
- https://github.com/beejjorgensen/bgnet/blob/master/examples/talker.c
- https://beej.us/guide/bgnet/html/index-wide.html#datagram