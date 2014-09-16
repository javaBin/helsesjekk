# JavaZone helsesjekk

Dette er helsesjekk-prosjektet JavaZone. Kjører i 

- Prod: [2014.javazone.no/helsesjekk](http://2014.javazone.no/helsesjekk/)
- Test: [test.2014.javazone.no/helsesjekk](http://test.2014.javazone.no/helsesjekk/)

Helsesjekk kan også kjøres fra kommandolinja:

`./status.sh prod`

## Oppsett

Installer `python` for å kjøre testene som trenger dette. Du trenger også `pip` for å dra inn følgende pakker:

- `pip install requests`
- `pip install python-dateutil`

For å kjøre opp serveren må `nodejs` være installert.

Hvis du lager noe som krever andre ting, før det opp her.

## Hvordan lager jeg en ny test?

Lag en ny fil i `components/`. Denne kan være skrevet i hva du vil, men må oppfylle følgende.

- Filen må være eksekverbar.
- Hvis komponenten som testes er oppe skal returnert statuskode være `0`. Returkode høyere enn `0` indikerer at noe er galt.
- Eventuell informasjon (engen komponenten er oppe eller nede) skrives til `stdout`.

Helsesjekken skal nå oppdage den nye testen og kjøre denne med de andre. Ved å pushe til GitHub vil testen oppdages ved neste kjøring i test/prod.

## Hvordan kan jeg disable en test?

Filer som ikke er eksekverbare vil ignoreres:

`chmod -x components/whatever.sh`

## Jeg lurer på noe annet

Snakk med Kjetil.

