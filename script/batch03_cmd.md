# Script eksempler

## Navigasjon
### Tilbake til toppen
- [Hovedsiden](../README.md)
### Innlevering
- [Innlevering](../innlevering/innlevering001.md)
- [Innlevering del 2](../innlevering/innlevering002_lite_tekst_noe_kode.md)
### Script eksempler
[Script](./README.md)  
Notis, her må du bruke tilbaketasten da .sh, .cmd, .py ikke støtter hyperlenker.  
Kildekodene er tenkt slik at de kan lastes ned å prøves på egen maskin.  
Alternativt kan du velge md-versjonen av hvert script , som i tillegg viser utskrift til skjerm.  
- [Script (Linux) Bash](./bash01.sh) Alternativt vise som [md-fil Bash](./bash01_sh.md)  
- [Script (Dos/Win/cmd) Batch 1](./batch01.cmd) Alternativt vise som [md-fil Batch 1](./batch01_cmd.md)   
- [Script (Dos/Win/cmd) Batch 2](./batch02.cmd) Alternativt vise som [md-fil Batch 2](./batch02_cmd.md)  
- [Script (Dos/Win/cmd) Batch 3] *  
- [Script (Win python) Python 1](./python01.py) Alternativt vise som [md-fil Python 1](./python01_py.md)  
- [Script (Win python) Python 1 versjon b](./python01b.py) Alternativt vise som [md-fil Python 1 versjon b](./python01b_py.md)  
<!-- 
- [Script (Linux python) Python 2](./python02.py) NB ikke klar enda 
- [Script (OS uavhengig python) Python 3](./python03.py) NB ikke klar enda 
-->
### Batch script
Sript demonstrerer ping mot en rekke IP-adresser . Det starter med laveste oppgitte IP-adresse og sjekker om alle
255 adresser svarer. Script demonstrerer en rekke batchkommandoer som er nyttige å gjenne til. 
Dette er forkortet versjon av batchh01.cmd-scriptet.
```batch
@echo off
:: Dette er samme script som batch01.cmd, men med langt mindre forklaringer, kommentarer og info til skjer.
:: Tanken er å lage et komplett program. Om noe er uklart så les om detaljer i batch01.cmd.

:: Info før du starter og informasjon om hva scriptet gjør
:: Programmet er "ufarlig" da det utfører ping mot en eller flere IP-adresser.
:: NB det utføres kun ping mot 5 adresser og ikke alle 255 som er maks kapasitet til programmet.
:: Linjen: FOR /L %%A IN (1,1,255) DO ( ping -a -n 1 -4 %currentiprange%.%%A |findstr /I /N /O /A:f1 /C:"TTL=" >> %outfile%  )
:: senere i programmet endres fra (1,1,255) DO til (1,1,5) DO. Så let etter den linjen om du vil endre på omådet. LEs om for med /?
:: omd trenger mer hjelp. Dersom en setter %currentiprange% til en guldig IP-adresse og %outfile% manuelt er linjen med
:: FOR /L %%A det eneste som trengs. Altså er dette lange programmet kun på en linje om en ønsker det. Rapporten blir ikke like bra
:: Men hovedhensikten som er å vise ping vil virke som det skal. Her er et slikt eksempel. NB endre på IPadressene om det ikke stemmer hos deg.

:: FOR /L %%A IN (1,1,16) DO ( ping -a -n 1 -4 102.168.11.%%A |findstr /I /N /O /A:f1 /C:"TTL=" >> rapportfil.txt  )

:: linjen over alt som trengs, alt annet er formattering og informasjon til sluttbruker. 

@prompt $D$G$S
@echo =========================== =========================== ======================

:: Velger noen IP-områder. Den andre linjen er for lokalt nettverk i egen bolg
:: Den første er område hos NTNU der folk.ntnu har adressen 129.241.56.95
set iprange1=129.241.56
set iprange2=192.168.1
@set currentiprange=%iprange2%

:: Rapportfilen med innhold.
@set outfile=".\filrep.txt" 

@echo.
@echo   Valgt IP-omraade er: %currentiprange%.1 - 255
@echo =========================== =========================== ======================

goto info

:: Potensiell fargelegging og eksempel på bruk av powershell inni et batch-script
:: CALL:
:DarkYellowINFO
%Windir%\System32\WindowsPowerShell\v1.0\Powershell.exe write-host -foregroundcolor DarkYellow %1
goto:eof


:info
:: En hopper over fargelegging av linjer i første omgang. Når de trengs hopper en innom :DarkYellowINFO
:: og så er dfet viktig å huske på exit fra denne. det bruker en spesialkommando goto:eof (end of file)

prompt $p$g
pause > nul


cls
echo.
echo =========================== =========================== ======================
echo.
echo Velkommen til mulitiping.
echo Dette "programmet" utforer ping til en IP-range og starter paa 
echo IP-adresse %currentiprange%.1 og slutter paa %currentiprange%.255 som er broadcast BC.
echo.


:: Nå brukes fargeleggingen. Dette kan gjøres flere ganger i programmet med ulike farger om ønskelig.
:: Da lager en flere linjer som :DarkYellowINFO over
call:DarkYellowINFO "Dette eksempelet paa et script / "program" er 'ufarlig' og kjorer i CMD."

goto ping
:: Mulig å legge flere forberedelseslinjer mellom informasjon og selve utførelsen av programmet

:ping
echo =========================== =========================== ======================
echo Naa er siste sjanse aa avbryte med CTRL+C om du ikke vil kjore "programmet"
echo Utkatalog:  %cd%\%outfile%
echo.
echo Pass paa %outfile% med katalogplassering er et gyldig du har skriverettigheter.
pause

echo Start ping: > %outfile%
date /t >> %outfile%
time /t >> %outfile%

echo.
echo Ping av IP-adresser er i gang. Alt sendes til rapportfil saa det vises ikke noe paa skjerm.
echo Det tar ca 3 minutt foer programmet er ferdig med alle IP-adressene.
echo.
FOR /L %%A IN (1,1,255) DO ( ping -a -n 1 -4 %currentiprange%.%%A |findstr /I /N /O /A:f1 /C:"TTL=" >> %outfile%  )
echo.  >> %outfile%
echo End ping: >> %outfile%
date /t >> %outfile%
time /t >> %outfile%
echo end ping 


goto end
:: Igjen om noe skal settes som f.eks. exit-kode o.l. så kan det settes her før :end som avslutter programmet.
:: Linjene etter :end er for å ordne opp i evt endringer som kan påvirke CMD i etterkant.

:end
prompt $p$g
echo end program

```
### Batch script utskrift til skjerm eksempel
```batch
echo Dette er innholdet i rapportfilen. 

Start ping:  
23.05.2023 
10:04
3:60:Reply from 192.168.1.1: bytes=32 time<1ms TTL=64
3:61:Reply from 192.168.1.2: bytes=32 time=1ms TTL=64
3:56:Reply from 192.168.1.70: bytes=32 time=34ms TTL=64
3:60:Reply from 192.168.1.80: bytes=32 time=1ms TTL=64
3:63:Reply from 192.168.1.90: bytes=32 time<1ms TTL=64
3:64:Reply from 192.168.1.100: bytes=32 time=2ms TTL=255
3:60:Reply from 192.168.1.110: bytes=32 time<1ms TTL=128
3:70:Reply from 192.168.1.120: bytes=32 time=39ms TTL=64
3:48:Reply from 192.168.1.130: bytes=32 time<1ms TTL=64
3:48:Reply from 192.168.1.140: bytes=32 time=32ms TTL=255
3:80:Reply from 192.168.1.164: bytes=32 time=125ms TTL=64
3:58:Reply from 192.168.1.173: bytes=32 time=393ms TTL=64
   
   
End ping:  
23.05.2023 
10:53

```

### Eksempel avsluttet