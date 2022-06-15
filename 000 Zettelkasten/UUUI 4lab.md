202206031107
Tags: 
# UUUI 4lab
## Pseudokod
- jedna numericka ciljna varijabla
- uanprijed slojevitu neuronsku mrezu i njen unaprijedni prolaz 
	- sta znaci unaprijed slojevita
		- znaci da **nema ciklusa**
	- potpuno povezana
- **slojevitost**
- matrica tezine i matrica pomaka

- da bi povecali ekspresivnost neuronske mreze
	- koristeni neuroni moraju imati nelinerane prijenosne funkcije
		- koristi se ReLU

- indeksiranje u viseslojnim mrezama
	- $w_{xy}^{(z)}$ 
		- x -> y, i ta veza se nalazi na z-tom sloju tezina
- kako zapisati tezine npr. drugog sloja ![[Pasted image 20220604175047.png]]
- vektor y cemo nazvati **izlazni vektor**
- unaprijedni prolaz
	- podatci propagiraju od pocetka do kraja 
- funkcija kazne ![[Pasted image 20220604180423.png]]file
## Umjetne neuronske mreze
- ucenje
	- eventualno ocekivanog izlaza, nakon toga dolazi do prilagodavanja tezina veza izmedu neurona - **nadzirano**
	- **nenadzirano** - grupiranje elemenata na temelju nekih slicnosti
- pretrenirarnost
	- mreza gubi svojstvo generalizacije i postaje strucnjak za podatke tj **streber**
		- pocinje "pamcenje napamet podataka"
- neuron
	- svaki ulaz $x_i$ ima tezinu $w_i$, sve ce ih sumirati i dodati prag $w_0$ **bias**, ta vrijednost ide u **prijenosnu funkciju**
		- funckija skoka **net**
- broj razreda
	- ako imamo dva razreda izlaz funckije ima dva jasno razluciva stanja **binarna klasifikacija**
		- pas ili macka
		- pozitivno ili negativno misljenje
	- modificirani ulazi
		- taj bias se mnozi i sa virtualnim nekim brojem koji je uvijek jedak 1
			- cisto tu da mozemo pisati da suma krece od 0 a ne od 1
			- **imamo pravac** sve ispod tog pravca je negativan, a iznad njega je pozitivan zakljucak
	- ako postoji vise razreda **n-binarna klasifikacija**
		- n razreda, imamo n bitova
			- pas (001) ili macka (010) ili papiga (100)
	- korekcija
		- stopa korekcije $\eta$ - broj izmedju 0.001 i 0.5
		- tek se vrsi u novoj rekurziji tj **epohi**
		- primjer korigiranja faktora![[Pasted image 20220603131014.png]]
			- na pocetku svake nove epohe dodas korekcijski faktor na svaki $w_i$
---
# References
- [array u numpy-u](https://www.geeksforgeeks.org/how-to-access-a-numpy-array-by-column/)