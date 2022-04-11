202201201636
Tags: 

# Procesi
- svaki proces posjeduje PID
	- ispisati sve programe `ps`
- razlika izmedu UNIX, BSD, GNU dodataka

## PS flags
- `aux`
	- ispis svih procesa zajedno sa prikazom koje resurse koriste ti procesi
- `faux`
	- ispis u obliku stabla, isti kao ovaj gore

## Stanje procesa
- R
	- running
- S
	- sleeping neaktivan 20 sekundi ili manje
- I
	- idle, vise od 20 sek
- T
	- stopped
- Z
	- zombie
## Child procesi
- init jedini nema roditelja PID = 1
- sa `fork()` mozemo napraviti child proces koji je gotovo identitican roditelju
	- razlika je fork() vraca
	- PID djeteta ako se poziva u roditeljkom procesu
	- 0 - u child procesu

---
# References