# Izvjestaj 20.5.
## Mailclient
- trenutacno ne radi kada se doda samo 
	- `[IP adresa mailserver] mail.cyberpoligon.local` 
	- na /etc/hosts od racunala
- dok `ping mail.cyberpoligon.local` radi na racunalu kojem se pokusavamo ulogirati u Thunderbird
- kada se pokusam ulogirati u Thunderbird client izbacuje  gresku  `Thunderbird failed to find the settings for your email account`
## Ansible
- potrebno napraviti `inventory` i `ansible.cfg` file-ove
- inventory predstavlja listu IP adresa, u nasem slucaju to su IP adrese nasih lokalnih docker container-a
	- takodjer u njemu navodimo na kojeg usera se spajamo i njegovu lozinku
	- sve cu raditi preko root korisnika u Docker containeru, a za to trebam promjeniti njegovu lozinku pomocu `passwd root`, dok smo ulogirani kao root

## Downgrade libre
```
sudo apt-get remove --purge libreoffice-core libreoffice-common
 
sudo apt-get autoremove --purge

# instalirati paket koji je exploitable


```
---
# References
https://www.the-digital-life.com/deploy-docker-with-ansible/ 
https://www.youtube.com/watch?v=5hycyr-8EKs&t=794s