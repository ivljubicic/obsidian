202112191615
Tags: 

# Poruka mentora
Docker compose možete koristiti za postavljanje cijele virtualne mreže računala na jednom fizičkom računalu, pa možete za početak krenuti tim putem. Računala opisujete kao docker-compose usluge u docker-compose.yml-u, pa je radna stanica razvojnog inženjera primjerice postavljena kao usluga _developer-workstation_.  
Kod pozivanja `docker-compose up` će se za svako računalo pokrenuti po jedan Docker container. 
## Software
Softver na te containere možete instalirati na dva načina. 
1. Prvi je uporabom Dockerfile datoteka koje opisuju containere i obvaljaju instalaciju potrebnog softvera, na koje se onda usluge u docker-compose-u pozivaju, 
2. Drugi je da svi containeri koriste generički Docker image (npr. neku Linux distribuciju), pa da Ansible obavlja instalaciju softvera putem SSH udaljene ljuske. 
Vjerojatno je za početak jednostavnije napraviti varijantu s Dockerfile datotekom, no pogledajte kako vama više odgovara. Primjer s Dockerfile datotekom možete vidjeti ovdje: [https://docs.docker.com/compose/gettingstarted/](https://docs.docker.com/compose/gettingstarted/)  

## Mrezna komunikacija
Što se tiče mrežne komunikacije, kroz docker-compose se postavlja relativno jednostavno i primjer imate ovdje: [https://docs.docker.com/compose/networking/](https://docs.docker.com/compose/networking/) 

U primjeru na linku se pokreću dva containera, web i db (svaki sebe vidi kao zasebno računalo), te se oba spajaju na istu virtualnu mrežu. Za web se mapira port 8000 na 8000 na lokalnom računalu, ali kako nije zadano sučelje na koje se mapira će se mapirati na sva sučelja. Ako je cilj da taj port bude dostupan samo na localhost-u, što je puno sigurnije, onda se dodaje i IP adresu loopback sučelja ovako: "127.0.0.1:8000:8000". Containeri će se i dalje međusobno vidjeti na mreži sa svim bitnim portovima, ali će dok se spajate sa svog računala vaše računalo vidjeti samo portove koji su mapirani.

U prezentaciji biste u 10-ak minuta trebali ispričati što točno radite i kakva je situacija s time. Još se dogovaramo oko termina.

Nadam se da sam uspio pojasniti neke stvari, ako imate dodatnih nejasnoća svakako pitajte.

# Vjerodajnice
-   Lokalne vjerodajnice možete dodavati Linux naredbom useradd, pa ih se onda prilikom instalacije u Dockerfile-u nakon stvaranja korisničkog imena koristi putem naredbe USER ([https://docs.docker.com/engine/reference/builder/#user](https://docs.docker.com/engine/reference/builder/#user)).
-   Za domenske vjerodajnice bi trebalo koristiti LDAP, pa pogledajte upute u vodičima ispod. Neki od njih su starijeg datuma, pa novije možete potražiti na Internetu. Konfiguracija LDAP-a je složena, pa za sada možete probati izvesti sve koristeći lokalne vjerodajnice te onda naknadno prijeći na domenske.
	-   [https://ubuntu.com/server/docs/service-ldap](https://ubuntu.com/server/docs/service-ldap)  
	-   [https://help.ubuntu.com/community/LDAPClientAuthentication](https://help.ubuntu.com/community/LDAPClientAuthentication)  

# Mail
-   Što se tiče maila, prvo bi trebalo postaviti mail poslužitelj (Postfix, ne Postgresql), pa onda postaviti njegove mail račune u Thunderbird klijentu na radnim stanicama. Dva vodiča za postavljanje su ispod.
	-   [http://www.postfix.org/VIRTUAL_README.html](http://www.postfix.org/VIRTUAL_README.html) 
	-   [https://www.serverwatch.com/guides/adding-users-and-aliases-for-postfix/](https://www.serverwatch.com/guides/adding-users-and-aliases-for-postfix/)

# Gui
Za uporabu GUI-ja na pojedinim računalima (recimo za LibreOffice i otvaranje phishing mailova) možete instalirati X11 pa koristiti X11 forwarding. Kratku raspravu o korištenju na Windows hostu možete vidjeti ovdje:
- [https://stackoverflow.com/questions/43508481/running-x-windows-desktop-apps-in-docker-containers-on-windows-10](https://stackoverflow.com/questions/43508481/running-x-windows-desktop-apps-in-docker-containers-on-windows-10)

Za kraj, preporučio bih da održavate docker-compose i Dockerfile datoteke na git repozitoriju, pritom nam svakako pošaljite link ili pozivnice. Prije postavljanja domenskih vjerodajnica, dakle nakon što riješite lokalne i mailove, bi možda bilo dobro da odmah isprobate napasti ranjivosti koje ste ugradili.

# Setupanje kiberneticke mreze
1. za svaki sustav napraviti docker compose file
---
# References