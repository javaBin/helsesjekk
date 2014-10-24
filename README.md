# JavaZone helsesjekk

Dette er helsesjekk-prosjektet JavaZone. Kjører i 

- Prod: [2014.javazone.no/helsesjekk](http://2014.javazone.no/helsesjekk/)
- Test: [test.2014.javazone.no/helsesjekk](http://test.2014.javazone.no/helsesjekk/)

Helsesjekk kan også kjøres fra kommandolinja:

`./status.sh prod`

## Oppsett

Installer følgende:

```
sudo apt-get install python python-pip
sudo pip install requests
sudo pip install python-dateutil
sudo apt-get install nodejs
```

…eller tilsvarende på andre OS.

Hvis du legger til noe med ytterligere avhengigheter, før det opp her.

## Hvordan lager jeg en ny test?

Lag en ny fil i `checks/`. Denne kan være skrevet i hva du vil, men må oppfylle følgende.

- Filen må være eksekverbar.
- Hvis komponenten som testes er oppe skal returnert statuskode være `0`. Returkode høyere enn `0` indikerer at noe er galt.
- Eventuell informasjon (enten komponenten er oppe eller nede) skrives til `stdout`.

Helsesjekken skal nå oppdage den nye testen og kjøre denne med de andre. Ved å pushe til GitHub vil testen oppdages ved neste kjøring i test/prod.

## Hvordan kan jeg disable en test?

Filer som ikke er eksekverbare vil ignoreres:

`chmod -x checks/whatever.sh`

## Hvorfor funker ikke driten på Mac?

Du har sikkert problemer med at `timeout`-kommandoen mangler. Hvis du på liv og død må debugge `status.sh` på Mac (det er jo et Vagrant-oppsett for pokker), så installer `coreutils` og bytt til å bruke `gtimeout` mens du holder på.

## Jeg lurer på noe annet

Snakk med Kjetil.

