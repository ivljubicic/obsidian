# Izvjestaj 15.4
## X11 configuracija
Trenutacno je Kibernetički poligon implementiran na Manjaru, na kojem se trenutačno nalazi *Xwayland*. Ovo se može saznati tako da se pokrene naredba
```
ps -aux | grep X
```
To izbaci sljedece rezultate:
```
ivan        3347  0.6  0.8 1192232 116548 ?      Sl   08:51   0:15 /usr/bin/Xwayland :0 -rootless -noreset -accessx -core -auth /run/user/1000/.mutter-Xwaylandauth.1PTJL1 -listenfd 4 -listenfd 5 -displayfd 6 -initfd 7
ivan        7040  0.0  0.0   6680  2556 pts/0    S+   09:29   0:00 grep X
```

Probao sam postaviti forwardanje GUI-a sa docker na sljedeći način:
```
docker exec -it -e XDG_RUNTIME_DIR=/tmp \                                                                                
-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY 
-e DISPLAY=$DISPLAY a30 bash
```
Izvor: https://unix.stackexchange.com/questions/330366/how-can-i-run-a-graphical-application-in-a-container-under-wayland
- ovo se specifino odnosi ako nema postavljane X11 infrastrukture, sto vrijedi za moju trenutacnu distribuciju
	- ali to nije radilo 

Trenutacno sam paralelno presao na istrazivanje alternative [x11docker](https://github.com/mviereck/x11docker) i postavljanje minimalne *x11 server* konfiguracije preko ovog [videa](https://www.youtube.com/watch?v=BHQGboT2--Y&t=118s)

### X11docker
Najveci problem zbog cega mislim da u konacnini necu koristiti ovu soluciju je sto *x11docker* automatski pokrece **image** preko komande `x11docker [IMAGE]`, a **ne contrainere**. Posto mi postavljamo sve preko *docker-compose*-a. *Docker-compose* automatski generira **containere** kojima mozemo pristup jedino pomocu naredbe `docker exec`, a koliko sam shvatio *x11docker* izvrsava naredbu `docker run` u pozadini.

### Plan za dalje
Nakon sto postavim GUI, provjeriti radi li slanje maila izmedu racunala. Nakon toga cu probati poslati mail preko *Social Engineering Toolkit*-a koji se nalazi *preinstalled* na *Kali Linux*-u.

---
# References
https://unix.stackexchange.com/questions/330366/how-can-i-run-a-graphical-application-in-a-container-under-wayland
https://www.youtube.com/watch?v=u9dBGWVwMMA&t=943s
https://nelkinda.com/blog/xeyes-in-docker/
https://medium.com/codex/running-gui-applications-in-docker-firefox-nautilus-file-manager-5424694104ec
https://github.com/mviereck/x11docker
https://www.youtube.com/watch?v=BHQGboT2--Y&t=118s