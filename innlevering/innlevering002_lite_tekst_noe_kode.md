# Intensjoen med dokumentet
## Navigasjon: (manuell foreløpig)
### Tilbake til toppen
- [README](../README.md)
### Innlevering
- [innlevering](./innlevering001.md)
- [innlevering del 2](./innlevering002_lite_tekst_noe_kode.md)
### Scripteksempler
- [Script](../script/README.md)

I dette dokumentet er tanken å vise en del kommandoer , fra de helt enkle til mer avanserte.

Hvorfr gjøre det slik. Noen ganger er det lettere å finne ut av noe om du ser det du leter etter, og andre ganger er en metode å teste det du finner.
På dette stedet https://github.com/kvapehe/cliogkoding/ skal det ikke finnes kode som gjlr nmoe eller stor skade uten at det informeres om det.

Fke.s del, format, rm og deltree kan gjøre en del skade så da er det nevt i teksten.

## Eksempel 01
https://github.com/kvapehe/cliogkoding/blob/main/lenker/speedinfo01.md

Denne "kompliserte" kommandoen oppsummerer mye av det en har lært om batch og bash-"progrramering" 
ping -q -w 1 -c 1 ip r | grep default | cut -d ' ' -f 3 > /dev/null && echo "OK Router er aktiv" || echo Feil router er nede" ping -q -w 1 -c 1 $(ip r | grep default | cut -d ' ' -f 3) > /dev/null && echo OK Router er aktiv || echo "Feil router er nede" ping -q -w 1 -c 1 $(ip r | grep default | cut -d ' ' -f 3) && echo OK Router er aktiv || echo "Feil router er nede"

Den kan skrives over flere linjer om en ønsker det. Da må en ta med \ på slutten av linjen, og noen koder er det gjort.
Det linjen gjør er p sjekke om "internett er OK" eller on rart skjer. Linjen er et lite eksperiment på hva som kna gjøres med bash i linux og det er lite som lar seg utfore i Windows.
