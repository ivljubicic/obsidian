#utr #faks #programming
# Razlika NKA i DKA
- U NKA ne mora biti prijelaz u **jedinstveno stanje** za jednistven input
	- slozeno stanje koje moze **biti prazno**
# Minimizacija DKA
- **uvijek prvi korak**
	- uklanjanje nedohvatljivih stanja
	- lista dohvatljivih stanja
		1. dodati $q_0$
		2. prolaziti kroz sve sto dohvacuje pocetno stanje
		3. dodavati ona koja vec nisu u listi
## Algoritam podjele stanja 2. algoritam
1. podijeliti na grupe po istovjetnim stanjima
	1. $G_{11}$ i $G_{12}$ 
2. prolaziti po svim parovima stanja i vidjeti jer se **prijelazi** nalaze u **istoj skupini**
3. razdvajati skupine ako ne se prijelaze ne nalaze u istim skupinama
	1. razdvojiti prvi dio para u jednu skupinu
	2. drugi dio para u drugu

## Algoritam 3.
1. nacrtati trokut tako da su retci od 1 do zadnjeg
	1. stupci 0 do (zadnjeg - 1)
2. **oznaciti** parove stanja koja **nemaju istu prihvatljivost**
3. za svaki par koji je **neozancen**
	1. ako ne prelaze u par, nego samo u isto stanje, **idemo dalje**
	2.	ako par stanja prelazi u par stanja koji nije oznacen sa X
		1.	dodati ih u skupinu prihvatljivih parova
		2.	lista uz taj (prijelazni par) => (par stanja iz kojeg su presli)
	3. ako par stanja prelazu par **koji je** oznacen sa X
		1. staviti X
		2. ako uz taj par imamo listu stanja **oznaciti cijelu listu

# Zadani $\epsilon$-NKA pretovoriti u minimalni DKA
## Primjer
![[Pasted image 20210427130848.png]]
## Algoritam
1. Pretvoriti $\epsilon$-NKA automat u NKA
	1. odrediti $\epsilon$ okruzenja nekog stanja
		1. nikad ne moze biti prazno jer **mora sadrzavati to stanje**
		2. gledati gdje prelazi to stanje uz pomoc epsilona, skroz dok nedodjemo do ded enda
		3. rjesenja
			![[Pasted image 20210427135649.png]]
	2. **odrediti prihvatljiva stanja** ako pocetno stanje u svom epsilon okruzenju ima prihavtljivo stanje onda dodaj $q_0$ medju prihvatljive, ako vec nije tamo
		-  Ako $F_1 \cap \epsilon$-okruzenje($q_0$) je prazan skup
		- onda $F_2 = F_1 \cup q_o$
		- inace $F_2 = F_1$
	3.  funckije prijelaza
		- za neko stanje i neki ulazni znak a
		- gledamo prijelaze iz epsilon okruzenja q za ulazni znak a
		- od tih rezultatnih stanja ponovo gledamo epsilon prijelaze
		- slika
			![[pravilo_prijelaza_enka_nka.png]]
2. [[NKA]] pretvorba [[DKA]]
	- stanja pisemo u [] zagradama
		- takvo stanje prijelaza koje ne postoji u stanjima DKA treba nadopisati
		- **neka stanja koja postoje u NKA ne moraju postojati u DKA**
	- Gledanje prijelaza slozenih stanja
		- gledas iz NKA ta stanja **istovremeno**
		- ako ne postoji prijelaz za odredeno stanje to onda prelazi u **posebno prazno stanje**
		- taj znak prijelazi za sve znakove u samo sebe
	- Prihvatljiva stanja
		- ako se u toj slozenoj skupini nalazi **barem jedno stanje** koje je prihvatljivo onda je cijela skupina prihvatljiva
3. Minimiziacija DKA
# Konstruirati DKA koji prihavaca neki jezik L
## Primjer
![[Pasted image 20210427160406.png]]
## Algoritam
1. Konstuirati DKA koji prihavaca L1
2. Konstuirati DKA koji prihavaca L2
3. DKA koji prihava spoj ta dva jezika na nacin koji je zadan u zadatku, u ovom slucaju to je **presjek**
## [[Regular expression]]
- r = a* b* c*
	- vise **uzastopnih** znakova
	- ne moze biti tipa niz bbac, acb
	- ![[regizraz_1.png]]
- r = a* (b+c)*
	- 0 ili vise **uzastopnih** znakova a
	- 0 ili vise uzastopnih znakova b **ili** c
	- ![[regizraz_2.png]]
## Operator of [[Regular expression]]
- L1 op L2 se gleda za prihvatljivost
- tablicu kreiramo slicno kao prije pocetno stanje je [q0, q0]
	- gledas di ona prelaze
	- za stanja koja nisu jos dodana u tablicu ih dodaj i gledaj di ona prelaze
	- ![[DKA_jezikL_regizraz.png]]
# Napise koji jezik je zadan [[Regular expression]]
- u kojem nema uzostopnih pojavljivanja 0
	1. Ako se pojavi 0 u nizu odma sljedeci znak mora biti ili 1 ili 2
		- (01 + 02 + 1 + 2)*
	2. **na kraju** moze biti **samo jedan** znak 0 ili nista
		- citati - moze ili ne mora
		- (0 + e)
# Ispitati ekvivaletnost [[Regular expression]]
- a^+ - znaci da se znak pojavljuje 1 ili vise puta
## Primjena algebarskih zakona
- $a^+ + e = a^*$
	- znaci da se moze ili ne mora pojaviti vise puta
- kada imamo vise $a^*$ 
	- to je efekitvno samo **jedan** $a^*$
- $(a^*)^*$
	- kao da pisemo samo jednom na *
- $a a^*$ ili $a^* a$ 
	- to je kao da pise $a^+$ 
- $(a^*+bb^*)^* = (a + b)^*$
- $b^*(a+b)^* = (a + b)^*$
	- vrijedi i za a umjesto b i da je obrnutim rijedoslijedom zagrada
# Moors automaton
## Pojasnjenje
- opisuje ostatak dijeljenja oktalno zapisanog broja brojem 5
## Postupak
- automaton ima 5 stanja koja oznacavaju trenutne ostatke dijelja s 5, (0 1 2 3 i 4)
- ulazni znakovi su zbog **oktalnog broja** brojevi 0-7
	- grupirati prema kongruentnosti s 5
	- basically koji brojevi daju isti ostatak
- formula prijelaza
	- ostatak_{n+1} = (ostatak_n * baza + znamekenka_{n+1}) % djelitelj
## Rjesenje
- [[moors_automaton_base_8.png]]
# Meelys automaton from Moors
- razlika je sto za prazni niz Meelys nece dati izlaz, a Moors hoce
- fukcija prijelaza **ostaje ista**
- sam gledaj izlaz koji daje neko stanje q
- ![[meelys_automaton_from_moors.png]]
# Moors automaton from Meelys
## Primjer
- [[moors_from_meelys_automaton.png]]
## Postupak
- gledamo **obje tablice**
- pocinjemo sa gdje ide [q0, 0] 
	- gdje ide q0 u prvoj tablici, a gdje u drugoj za neki **ulazni znak** u nasem slucaju to su 0 i 1 koji su navedi **na vrhu**
	- imamo novo [prva tablica, druga tablica]
	- dodamo to novo stanje u tablicu prijelaza ako se tamo vec ne nalazi
- 0 u ovom slucaju predstavlja sljedece stanje
- i tako u svim novim dodanim parovima
## Rjesenje
! [[moors_from_meelys_automaton_solution.png]]
# Generitati grammar
- nad abecedom 0,1,2 koja generira nizove kojima nema uzastopnog ponavljanja podniza 01
## Grammar definition
- G = (V,T,P,S)
	- T je abeceda, skup zavrsnih znakova
	- V skup nezavrsnih znakova S, A, B, C
		- A oznacava da smo generirarali 0
		- B generirali 01
		- C generirali 010
		- spada pocetno stanje S
## Grammar from DKA
- Q prelazi u V
	- q0 - S
	- q1 - A
	- q2 - B
- abeceda je T
- S je q0
- produkcija
	- S -> aS | bA | cB | **e - jer je q0 jedino prihvatljivo stanje**
	- analogno ide za A i B
### Lijevo/desno linearna grammar 
- lijeva - generira niz s desna na **lijevo**
- desna - generira niz slijeva na desno **desno**
	- zadnji znak je **za**
# Pretvoriti grammar u LLG
# Izbaciti sve beskorisne znakove iz gramatike
1. izbacivanje mrtvih znakova
	1. stavljamo u listu **zivih znakova** zavrsne znakove (one koje su napisane malim slovom)
	2. gledaj jel ima za znakove iz zivih neka nezavrsna stanja koja generiraju samo zive nizove npr. E u generira ed i ac znaci E mozemo dodati u zive
	3. ponavljati algoritam sve dok nismo prosli kroz sve kombinacije kad **god dodamo novi znak u zive**
	4. izbacivanje sve produkcije(strelice lol) koji sadrze mrtve znakove
## Rjesenje: zivi znakovi
- ![[grammar_live_signs.png]]
## Lista dohvatljivih znakova
- uvijek ide S i svi znakovi koje S generira
- slican postupak kao sa mrvim znakovima nadalje
- **bitan redoslijed izbacivanja**
# Izbaciti iz gramatike jedinice produkcije i e-prijelaze
1. izbaciti jedinicne produkcije
	- izbacujemo C->D
	- ali ne C->(neko malo slovo)
		- treba D zamjeniti sa C
	- D je postao nedohvatljiv pa treba i ostale nizove izbaciti
2. izbacivanje e-produkcije
	1. u prazne znakove dodati sve one znakove koji su lijevo od e-produkcija
	2. ako postoji produkcija na cijoj su desnoj strani samo prazni znakovi **treba i nju izbaciti** i dodati u prazne znakove
	3. iterativno ponavljati postupak
	4. **stovirit nove produkcije** - n praznih znakova -> $2^n$ novih produkcija
		![[Pasted image 20210427212908.png]]
		- basically razdovojiti tako da produkcija sadrzi sve kombinacije praznih znakova
		- iz gornjeg niza nastaju 4 doljnja
		![[Pasted image 20210427213208.png]]
		- iz A->BC nastaju
		- mogu oboje reci u e
			- taj niz se automatski izbacuje
3. ponovo izbaciti jedinicne produkcije
	- nema koraka da brisemo nedohvatljive nizove
	![[Pasted image 20210427214004.png]]
	- iz A -> C nastaju A->zXC i sve nadalje
## Rjesenje
