202203300933
Tags: 

# UUUI 1 lab
- šta je potpunost, optimalnost
	- potpunost je akko pronalazi rjesenje uvijek kada ono postoji
	- optimalan je akko pronalazi rjesenje sa najmanjom cijenom 
- za algoritme BFS, UCS, u dubinu, A* je potrebno znati da li su potpuni i optimalni te ako nisu zašto, za njih treba znati i PS/VS
	- b oznacava faktor grananja
	- d je dubina optimalnog rjesenja
	- BFS
		- potpun i optimalan, u svakom koraku prosuje se najplici cvor pa je strategija optimalna
		- PS $O(b^{d+1})$
		- VS $O(b^{d+1})$
	- UCS
		- potpun i optimalan
		- PS i VS stavi se da je $d=C^*/\epsilon$
		- gdje je $C^*$ optimlana cijena do ciljnog stanja
		- $\epsilon$ minimalna cijena prijelaza
	- DFS
		- nije potpun jer moze zaglaviti u beskonacnoj petlji
		- nije optimalan jer ne pretrazuje razinu po razinu
		- PS(bm)
			- m je maksimalna dubina stabla
		- VS $(b^m)$
	- A*
		- potpun jer uzima cijenu puta u obzir
		- optimalan uz uvjet da je heuristika optimisticna
		- PS i VS O(min(b^{d+1}, b|S|))
		- https://youtu.be/kTZv3lS0BPc?t=1276
		- |S| je broj stanja tj kardinalitet od S
			- gornja ograda za slozenost
			- necemo ponavljati stanja
 - za svaki algoritam treba pokazati i objasniti kod te kako radi algoritam
 - kako iz BFS dobijemo pretraživanje u dubinu
	 - tako da se nodovi dodaju na **pocetak liste open** umjesto na kraj
 - kako iz algoritma u dubinu dobiti algoritam koji je potpun i optimističan
	 - dodati tako da pretrazuje jednu po jednu razinu
 - ja nisam riješio A* al me svejedno pitao kako radi 
 - objasniti optimističnost heuristike + prolazak kroz kod 
 - objasniti konzistentnost heuristika + prolazak kroz kod 
 - je li konzistentna heuristika ujedno i optimistična
	 - ne, svejedno moze precjeniti stvarnu duljinu do puta iako je konzistenta
 - zašto je kod A* bitna konzistentnost
	 - procjena ukupne cijene puta (dakle prijeđeni put + heuristička procjena do cilja) je funkcija koja monotono raste.
	 - ako monotono raste, kada prvi put dođeš u neko stanje, imaš garanciju da svaki sljedeći put kad naiđeš na njega pri širenju fronte, to će biti s cijenom koja je barem jednaka prvom nailasku ili veća
	 - u svakom slučaju ne moraš ga ponovno razmatrati i otvarati i sl., izbjegavaš ono gdje obradiš neki čvor, pa malo kasnije nađeš neki jeftiniji put do njega pa ga moraš opet obrađivat jer ak si našao do njega jeftiniji put, vjerojatno i do njegove djece imaš jeftiniji put itd itd
	 - uglavnom smanjenje broja korak
 - objasniti svojstvo dominacije + kako iz 2 optimalne heuristike napraviti trecu koja je dominantna nad prve dvije
	 - dva algoritma $A_1^*$ i $A_2^*$ s optimisticnim heuristikim funkcijama $h_1$ i $h_2$, algoritam 1 dominira nad 2 akko:
		 - za svaki cvor s je heuristika 1 veca ili jednaka od heuristike 2
		 - takodjer se kaze da je algoritam 1 **obavjesteniji**
	 - kako napraviti trecu da je dominantna
		 - uzmes onu obavijesteniju heuristiku i za svaki cvor vrijednost heuristike neka bude barem za jedan vise od te heuristike


---
# References