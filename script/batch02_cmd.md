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
- [Script (Dos/Win/cmd) Batch 2] *  
- [Script (Dos/Win/cmd) Batch 3](./batch03.cmd) Alternativt vise som [md-fil Batch 3](./batch03_cmd.md)   
- [Script (Win python) Python 1](./python01.py) Alternativt vise som [md-fil Python 1](./python01_py.md)  
- [Script (Win python) Python 1 versjon b](./python01b.py) Alternativt vise som [md-fil Python 1 versjon b](./python01b_py.md)  
<!-- 
- [Script (Linux python) Python 2](./python02.py) NB ikke klar enda 
- [Script (OS uavhengig python) Python 3](./python03.py) NB ikke klar enda 
-->
### Batch script
Sript demonstrerer hvordan en kan finne filer og dokumenter i cmd. Det krever at bruker oppgir mappe og filnavn.
Script demonstrerer en rekke batchkommandoer som er nyttige å kjenne til.
```batch
@echo off
:: Forklaringer på ulike linjer i kode er til slutt i programmet. Det sparer en for litt unødige kommentarer underveis.
:: Ved å se på alle eksemplene vil en se mye kodelinjer er like og på den måte forstå hva koden gjør.

echo.
echo Dette programmet leter etter det du ønsker. (NB norske tegn er ikke lurt)
echo Det vil så åpne et dokument med det som er funnet og plasseringen på maskinen.
echo Det er noen begrensinger i programmet. Bla må du velge stedet det skal søkes fra, og 
echo dersom det ikke gjøres brukes plasseringen du ser om du skriver cd uten noe bak. (cd)

echo.
:: Setter feilkode til -1 som betyr noe er galt. Denne rettes til slutt om en når :veryend
set ERRORLEVEL=-1

set arg1=%1
set arg2=%2
if %arg1% == "" (goto usage)
if %arg2% == "" (goto usage)
goto start

:: C:\Users\bruker
:usage
echo Eksempel på bruk: 
echo dir ..\ /s /b /a f3*.tx* |findstr "f3"
echo.
echo Returnerer kasnkje dette:
echo C:\Users\elev1\.arduino-create\arduino\windows-drivers\1.8.0\drivers\.git\objects\40\af396a0ea3c0919709e49a9d343514988f7e26
echo C:\Users\elev1\.arduino-create\arduino\windows-drivers\1.8.0\drivers\.git\objects\41\a890d1131ef889b772d86c5c4d1803bea0df3c
echo C:\Users\elev1\.arduino-create\arduino\windows-drivers\1.8.0\drivers\.git\objects\45\4de03e94366ab70843abf5f9f3056b84f6fb9c
echo i tillegg til det en leter etter f3.txt
echo C:\Users\elev1\f3.txt
echo aarsaken til resultatet er at teksten f3 finnes et sted i de tre ekemplene over og derfor maa en vaere presis med det en leter etter.
echo Legg merke til norske tegn naa er unngaatt, og maate aa gjoere dette er aa kun skrive paa engelsk, siden det norske spraaket
echo bruker de tre siste tegnene i alfabetet i stor grad.
echo Her er argumentene du skrev inn: %arg1% og %arg2%
goto showerrors

:start
:: 
rem Her starter programmet. REM er kommentar og cmd eller .bat skiller ikke mellom store eller smaa bokstaver.
rem Magiske tegn :: er en label som gjør at en kan hoope i koden. Dette er ikke bra programmeringsskikk i programspråk slik som c++ eller python, 
rem men for batch-programmering er dette en av få muligheter en har til å lage programstruktur / logikk.
rem bør unngås siden da leses hele linjen til endes og det er ikke nødvendig med kommentarer- Ved å benytte ::
:: unngår en å lese hele linjen, og programmet blir mye raskere. Om en vil teste dette selv så lag et program med 1 million linjer.
:: NB ikke lag programmet manuelt, programmer dette. Det tar ca 5 -- 10 min å lage en slik generator. Forslag, python, php, c++ kan benyttes.
:: sett rem foran hver kommentar, og lage en versjon med :: istedenfor rem. Da vil en se en mangedobling av hastigheten programmet kjører.
:: Legg merke til Æ ø Å er benyttet nå når det er kommentarer. Disse linjen vises ikke, og en må redigere filen for å se de.
:: Windows kan vise æ ø å om det er rett tegnsett, mens cmd vil slite med det om en ikke gjør noen triks.
:: Knakje dette er rettet med W11.

:: Selve programmet. Alt rundt styrer logikk eller er ekstra mas

echo Her er din kommando:
echo "dir %arg1% /s /b /a %arg2% |findstr "%arg2%" "
dir %arg1% /b /a %arg2% |findstr "%arg2%"
echo Data: dir %arg1% /s /b /a %arg2% |findstr "%arg2%"
goto end


:end
:: Det skjer ikke så mye her, men alltid lurt å ta med label end, very end er med bare for å ta med noe helt til slutt.
:: dette er med som et eksperiment slik at en kan se returkoder og bruke ERRORLEVEL for å teste på disse.
:: Koding med ERRORLEVEL er en relativt primitiv metode som batch er en av få sprk som benytter.

goto veryend
:: Det er alltid lurt å avslutte et program med en avslutting som :end. Dette er en label det hoppes til,
:: I denne kan en lage noe som kalles returkode eller ERRORLEVEL-kode eller exit-kode (eller flagg om en vil).
rem Det fleste program returnerer 0 når alt går bra. -1 om noe gikk galt og et annet tall om en ønsker det.
:: På den måten kan en styre hva som skjer etter programmet er utført.
:: F.eks. er det ingen grun å åpne fil i notepad dersom noe gikk galt. Da blir filen tom og får et navn.
:: Noen ganger bli programmer store. Dette er ca 100 linjer så det nærmer seg stort. da kan en benytte kommandoen call
:: Når programmet som kjøres er avsluttet kan dette returnere ERRORLEVEL og så kan deette programmet som benyttet call fil.cmd teste på hva koden viser.
:: På denne måten kn en lage seg et delvis hirarkisk system.


:: Tegnet @ gjør at første linje ikke vil vises
:: Tegnet eller ordet echo er kommandoen for det som skal vises på skjermen. uten echo off ville en nå fått to stk. av det etter echo.
:: En fordi en skriver echo, og en som er svaret. Teksten echo off slår av dette.
:: Spesialkoden echo. lager et linjeskift eller mellomrom på skjermen. Denne  kommandoen er restriktiv slik at echo . ikke er det samme som echo.
:: I tillegg må de fleste kommandoer starte på starten av hver linje for å virke. Det er det som gjør det mulig å skrive om de i denne seksjonen.
:: 
:: %tekst% er en variabel.
:: %1 er første argumentet fra kommandolinjen (cli)
:: %2 er neste argument og slik fortsetter det til maks 9 argument. Dette programmet bruker kun 2 eller tre argument eller ingen, slik at det ikke er noe å tenke på.
:: 
:: En versjon av programmet med langt mindre tekst er med som vedlegg.
:: echo %ERRORLEVEL%

:veryend
:: Da var du ved veis ende. Da er det lurt å nullstille feilkoder, med mindre det skal returneres en kode.
:: Poenget med en slik slutt er å renske kode og rydde i evt. variabler og utskrift til filsystemet, skjer eller evt skriver.

set ERRORLEVEL=0
:: echo %ERRORLEVEL%
:: exit %ERRORLEVEL%
:: veryend nullstiller nå variabel og kode. Du kna gjerne vise den med echo, da fjerner du de to :: foran echo.
:: Å bruke print til skjerm er en velkjent feilsøkingsmetode en alltid bør benytte.

:showerrors
echo %ERRORLEVEL%
```
### Batch script utskrift til skjerm eksempel
```batch
```

### Eksempel avsluttet