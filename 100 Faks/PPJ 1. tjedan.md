# Linker i loader
## Linker
- povezuje razlicite module
## Loader
- odreduje memorijske adrese i onda ih izvrsava

# Jezicni procesor
-  rade u dvije faze
	-  faza analize
		-  pretvara se u strukturirani oblik neki
		-  koraci analize
			-  leksicka analiza ==leksicka pravila==
				-  jesu li dobro napravljene **leksicke jedinke**
					-  grupira ih **leksicki analizator**
					-  ==primarni cilj== izvorni program translejtati u leksicke jedinke
						1. slijedno citanje znakova
						2. grupira znakove u leksicke jedinke
						3. prepoznaje i oreduje klasu leksickih jedinki
						4. jel se postuju pravila
						5. cisti nepotrebne dijelove koda - komentare i whitespaceove
					-  varijable, kljucne rijeci i konstante
				-  gledaju se leksicka pravila jesu li dobro iskrositeni osnovni elementi programskih jezika
					-  varijable, kljucne rijeci, konstante, operatori, specijalni znakovi
				- npr. ime varijable treba zapoceti slovom, a ne brojkom
				- leksicne klase
					-  IDN identifikatori
						-  imena varijabli
					-  KR kljucne rijeci
						-  if else for while
					-  INT 
					- FLOAT
					- SO specijalni znakovi
						- == < > 
			-  sintaksna analiza
				- jel valja sintaksa
			- semanticka analiza
				- provjera jel logika valja
				- npr jel se zbrajaju medusobno isto tipne varijable
	-  faza sinteze ciljnog programa
		-  generiraju naredbe strojnog koda
		-  generiranje medukoda
		-  ==upravljanja tablicom znakova==
			-  

[[Tablica znakova]]
[[Leksicka analiza]]