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

---
# References