# Docker network
Kada se Docker containeri postave uz pomoć Docker Compose-a oni se automatski nalaze na istoj mreži i mogu međusobno komunicirati preko IP adrese. Po defaultu, ne postoji DNS rezolucija za imena Docker container-a, te se mora koristiti IP adresa da bi pristupili Docker containeru koji se nalazi.

Mail adrese dodajemo pomoću skripte `setup.sh` koja dolazi sa Docker Mailserver container-om tako da upišemo sljedeću naredbu u komandnu liniji:
 ```./setup.sh email add ceo@cybernetwork.fer```.
 
---
# Linkovi
- https://docker-mailserver.github.io/docker-mailserver/edge/config/setup.sh/
- https://github.com/docker-mailserver/docker-mailserver