202112091202
Tags: 

# Zamjenski znakovi
## Wild cards
- ==used in for example in ls==
	- the shell replaces the regular expressions with the intended letters
- ? only one character
- \* any number of characters
- [xyz] only one letter from xyz
	- [nw]\* beginning with n **or** w

### Wild cards examples
- all files that contain **at least** one number
	- `ls -l /bin/*[0-9]*` 
	- can be used with letters [a-z]
- all files that **don't contain any numbers** ==inverting sets==
	- `ls -l /bin/*[^0-9]*`
- all files that contain a \* character in them
	- `ls -l /bin/\**`
	- `ls -l "/bin/*"`
## Regular expressions
- ^ begging of the row
- $ end of the row
### Quantifiers
- x* contains 0 or more x characters
- x+ contains 1 or more x
- x? 0 or 1
- x{n} n number of x
- x{n,m} between n and m x

### Regular expressions examples
- a line that does't end with a
	- `.*[^aA]$`
- a line that contains troznamenkasti ili cetveroznamenkasti broj
	- `.*[0-9]{3,4}.*`
- `egrep "(a|c).+e$" retest`
	- only keeps nakon a ili e mora se pojaviti barem jedan znak i mora linija zavrsava za e

### Classes of characters
- need to put them inside brackets \[[:alnum:]]
- [:alnum:] znakovi abecede ili brojevi
- [:blank:] praznina ili tabulatori
---
# References
- [okosl 05](https://www.youtube.com/watch?v=xtdtBtsMtKw)