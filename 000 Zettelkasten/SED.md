202112091259
Tags: 

# SED
- stream editor
## SED examples
- replace every **first occurrence** of potato with tomato
	- `sed -r "s/potato/tomato" file.txt`
- replace **all occurrences**
	- `sed -r "s/potato/tomato/g" file.txt`
	- /g global
- normally prints to global out
	- provide flag `-i` to replace **in place**
### Harder SED examples
- replace every second word
	- `([a-z]+) ([a-z]+)` looks for two words that have at least one character and are separated by a space
	- `sed -r "s/([a-z]+) ([a-z]+)/\2 \1/g" text.txt`
---
# References