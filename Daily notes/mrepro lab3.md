202205191015
Tags: 
# mrepro lab3
## Razlika studosa
- radimo retransmisiju nakon **1 sek**, a ne nakon **3 sek**
- dodati [-d] support
	- saljemo poruke kao ovaj u stodosima
- saljemo samo iz direktorija `/tftpboot`
	- isto kao studosi

- pseudokod
	- ucitaj varijable
	- provjeri za **demonizeanja**
		- samo zapisi u syslog stvari i promjeni ispis svaki put
	- napravi socket i bindaj ga
	- primaj poruku
	- nakon sto je primis forkaj, i forku posalji primljeni TFTPpacket, cli i cli len
	- **fork**
		- napravi novi socket
		- bindaj, sve isto
		- nesto sa kopiranjem prva dva byta
			- ntohs napravi nad tim
		- skuzi dali je broj 1
			- ako je napravi rrq_proc
			- ako nije posalji error
	- **rrq_proc**
		- parsiraj packet
---
# References