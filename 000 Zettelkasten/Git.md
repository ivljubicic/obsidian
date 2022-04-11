# Branches
- git checkout -b ime_brancha
- git commit -m "commit on new branch"
- git checkout master

## Merge
- git merge master
	- mergati ce se sa branchom koja je trenutcano aktivna 

- git push -u origin master
	- -u definiramo upstream i gdje tocno pusamo(origin) sa koje branche (master)
## Pulanje promjene
- git pull origin master
	- where i want to pull from (origin)
	- what i want to pull (master)

## Sta kada se dogodi konflikt
- manullay promjeniti sta treba
- sa pc dodati promjene `git add .`
- commitati `git commit -m "poruka"`

## Pushanje drugih promjena
- promjeniti na branchu `git checkout branch`
- git push origin branch
	- u UI se vidi branch
		- make a **pull request**

# Github
## Create repository
```
echo "# web\_projekti1" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:ivljubicic/web\_projekti1.git
git push -u origin main
```
## Push an existing repository
```
git remote add origin git@github.com:ivljubicic/web\_projekti1.git
git branch -M main
git push -u origin main
```