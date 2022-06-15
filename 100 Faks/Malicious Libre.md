202206011500
Tags: [[Zavrsni rad]] 
# Malicious Libre
- verzija 6.2.6
## Removing libre
```bash
sudo apt-get remove --purge libreoffice-core libreoffice-common

sudo apt-get autoremove --purge
```

## Installing libre
```bash
add-apt-repository ppa:libreoffice/ppa
apt-get update
apt-get install -y libreoffice
```

## Pokusaj downgrade-anja
---
# References
- [exploit-db](https://www.exploit-db.com/exploits/47298)
-  