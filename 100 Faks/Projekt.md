---
date updated: 11-11-21T21:47:19+01:00

---
# Generalni read me kako pokretati kiberneticku mrezu
1. za pokretanje svih virtualnih machina `sudo docker-compose up`

`cp /tmp/.XO{,.backup}`

# Docker
- na OS-u npr. Ubuntu-u mozemo samo imati Docker containere koji su bazirani na **istom kernelu**
	- znaci CentOS, OpenSUSE i sam Ubuntu itd.
1. treba se pullati docker container koji se moze naci na https://hub.docker.com/
	- `docker pull [image name]`
2. pokretanje paketa kojeg smo upravo pullali
	- `docker run -d -t --name [proizvoljno ime] [image name]`
3. spajanje na docker image
	- `docker ps`
		- izlistavanje svih docker image-a koje imamo
	- `docker exec -it [proizvoljno ime] bash`
		- spajanje na bash ljusku

## Networking on docker
-  

# Docker compose
- grupirati vise containera kao jedan servis
	- to omogucava da mogu komunicirati medusobno kada je to potrebno

# Kubernetes
- puno lakse napraviti cluster preko nekog cloud providera
- master
	- preko kubectl se mogu runnati sve komande 
	- ima ugradeni sheduler koji gleda koji worker node ima najmanje posla i njemu dodjeljuje "Pod"
		- svakom containeru se dodjeljuje 1 pod

# Ansible
- sluzi za izvrsavanje naredbi na vise racunala odjednom
- povezuje se preko SSH protocola
## Playbooks
- .yaml fileovi koju sluze za izvrsavanje vise naredbi odjednom
	- npr. mozemo provjeriti nalazi li se na racunalima odgovarajuca verzija nekog softwera
- pokrecu se sa `ansible-playbook [ime .yml file-a]`

# Moguci attack vectori na sustav
## Landscape skripta
- postoji li nacin kako injectati nesto preko Portfolio website-a
	- ranjivosti za Apache
- za daljnje lateralno kretanje u mrezi
	- ranjivosti za OpenLDAP i Postfix
	- Postfix je nadalje povezan sa Email serverima koje koriste svi zaposlenici, ukljucujuci CEO-a firme
	- korisititi **HashCat** ili **JohnTheRipper** za bruteforcanje sifri
		- ako koristimo HashCat prvo trebamo se docepati credentialsa

# Ranjivosti
- Ubuntu Linux
  - latest version 20.04
  - LPE 16.04 [PoC](https://www.exploit-db.com/exploits/47169)
- CentOS 7.9-2009
  - latest version7.9-2009
  - LPE 7.6  [PoC](https://www.exploit-db.com/exploits/46989)
- Postfix
  - latest version 3.6.3
  - LPE 2.6 [PoC](https://www.exploit-db.com/exploits/6337)
  - Remote command injection for SMTP [PoC](https://www.exploit-db.com/exploits/34896)
- OpenLDAP
  - latest version 2.6.0
  - 2.4 Remote DoS [PoC](https://www.exploit-db.com/exploits/35445)
  - users login using domain credentials
  - comes most commonly in pair with **Kerberos**
    - MIT Kerberos 5 RCE [PoC](https://www.exploit-db.com/exploits/35606)
- Apache HTTP Server
  - latest version 2.4.51
  - 2.4.50 RCE and Path Traversal [PoC](https://www.exploit-db.com/exploits/50406)
  - 2.4.49 RCE and Path Traversal [PoC](https://www.exploit-db.com/exploits/50383)
- Libre Office
  - latest version 7.2
  - < 6.2.6 Python Code execution [PoC](https://www.exploit-db.com/exploits/47298)
    - Metasploit
- Mozilla Thunderbird
  - latest version 91
  - Heap based buffer overflow [PoC](https://www.exploit-db.com/exploits/47002)
- Mozilla Firefox
  - latest version 71
- Visual Studio Code 1.61.0
  - 1.47.1 local DoS [PoC](https://www.exploit-db.com/exploits/49882)
  - 1.57.1 RCE [NVD](https://nvd.nist.gov/vuln/detail/CVE-2021-34529)

# Pitanja
- trebam li ja napraviti nesto slicno kao rjesenje ALPACA