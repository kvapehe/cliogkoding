# Retur fra script-eksempel
## Navigasjon: (manuell foreløpig)
### Tilbake til toppen
- [Hovedsiden](../README.md)
### Innlevering
- [Innlevering](../innlevering/innlevering001.md)
- [Innlevering del 2](../innlevering/innlevering002_lite_tekst_noe_kode.md)
### Scripteksempler
- [Script](./README.md)
- Notis, her må du bruke tilbaketasten da .sh, .cmd, .py ikke støtter hyperlenker.
- Alternativt kan du velge md-versjonen av hvert script
- [Script (Linux) Bash](./bash01.sh) Alternativt vise som [md-fil Bash](./bash01_sh.md)  
- [Script (Dos/Win/cmd) Batch 1] *   
- [Script (Dos/Win/cmd) Batch 2](./batch02.cmd) Alternativt vise som [md-fil Batch 2](./batch02_cmd.md)  
- [Script (Dos/Win/cmd) Batch 3](./batch03.cmd) Alternativt vise som [md-fil Batch 3](./batch03_cmd.md)   
- [Script (Win python) Python 1](./python01.py) Alternativt vise som [md-fil Python 1](./python01_py.md)  
- [Script (Win python) Python 1 versjon b](./python01b.py) Alternativt vise som [md-fil Python 1 versjon b](./python01b_py.md)  
<!-- 
- [Script (Linux python) Python 2](./python02.py) NB ikke klar enda 
- [Script (OS uavhengig python) Python 3](./python03.py) NB ikke klar enda 
-->
```batch
:: Info før du starter og informasjon om hva scriptet gjør

:: Før du studerer koden, så kjør programmet minst en gang.
:: Programmet er "ufarlig" da det utfører ping mot en eller flere IP-adresser.

:: Slik det er skrvet nå er IP-adressene lokale. bruk ipconfig i CMD på egen PC
:: for å se de adressene du selv kan bruke. NB om alle maskiner i IP-adresse-området
:: har brannmur kan det hende rapporten til slutt er tom. ping vg.no har adresse
:: 195.88.55.16 så test med denne om du ikke får til andre. folk.ntnu.no har
:: 129.241.56.95, men pass på du ikke bruker ping for mye mot denne IP-range'en.

:: Det kan hende din maskin blir sperret om NTNU reagerer på det. (Les om DOS, DDOS, og andre angrepsmetoder på nett)
:: Strengt tatt skal det gå gret da ping in Windows ikke "maser" for mye. Ping sender maks en ping pr. sekund
:: På linux er det mulig å sende flere tusen ping pr. sekund til en adresse, og dette kan oppfattes som angrep.
:: Derfor er adressen som er i bruk en lokal IP-adresse med lokalt område. Endre dette til noe som virker hos deg

:: Da trenger du ikke lese mer før scriptet / "programmet" er testet, men det er helt opp til deg selv.




:: Informasjon om selve programmet

:: Setter noen variabler som benyttes senere
:: Husk å fjerne siste del av IP-adresse før løkken benyttes om du bruker andre enn de som er vist. 
:: Den forste er til servere på NTNU der 129.241.56.95 er folk.ntnu.no
:: Alle de andre er IP-adresser til annet utstyr med samme IP-range 1 - 254

:: Den neste er IP-adresser til eget utstyr. Dette er såkalt privat IP-range (Les på nett om IANA private IP eller APIPA)
:: Legg merke til det kun er de tre forste oktettene / Bytes som settes, den siste dukker opp i loekken under.

:: Det er iprange2 som benyttes i dette scriptet så bare bytt ut med den for ntnu om du vil teste de.
:: Årsaken til privat adresseområde benyttes er i tilfellet NTNU blokkerer egen IP dersom en "maser" for mye. 
:: Se informasjon i starten for mer detaljer om dette.

:: Det har fungert å pinge alle eneheter to - tre ganger på rad innen en times tid uten å bli blokkert, men
:: en vet aldri hvordan brannmur, IDS eller annet vil håndtere multiple ping-forespørsler til et adresseområde.



:: Da starter litt introduskjon om scriptet
:: De to :: eller egentlig REM er kommentarer. To :: er egentlig en tom label. Mer om dette senere.
:: Dersom to kolon foran echo off fjernes så kan en justere med noen echo. Eksperimenter selv.
:: NB alle @ blir forklart litt senere, etter du har sett hvorfor de er med og hvordan en kan unngå
:: å skrive de på "hver" linje etterhvert.
:: @echo off  
:: echo.
@prompt $_
cls :: Kommandoen cls rensker skjermen. cls betyr Clear screen
echo.
@echo Dette "programmet" brukes som opplaering. Det kombinerer echo og kommentarer.
@echo Det som sendes til skjerm vises med echo. Det som er gjemt bak :: er kommentarer.
@echo Start "programmet" for aa se hva det gjor.
@echo.

:: echo prompt $D$_$S viser dato og et mellomrom. $_ er linjeskift. Se help eller skriv prompt /? for mer hjelp.
::@prompt $D$_$S
@prompt $D$G$S
@echo =========================== =========================== ======================
:: Legg merke til kun 3 av fire tall er med. En kunne skrevet dette slik batch02 192.168.1
:: når en kaller kommandoen, men for å gjøre det lettere å bruke kommandoen er alt utfyllt på forhånd
:: En kan lage flere iprange variabler under eller en kan endre på de som vises under.
:: NB i denne omgang er det iprange2 som benyttes da dette er privatw IP-adresser.
:: IP-adresse 129.241.56.95 er til folk.ntnu.no så om en endrer koden der set currentiprange=%iprange2%
:: vises til set currentiprange=%iprange1% eller det en selv legger inn, da endres IP-range det søkes etter.


::@echo.
set iprange1=129.241.56
set iprange2=192.168.1
@set currentiprange=%iprange2%

:: Kommandoen set outfile=".\filrep.txt"  brukes for å sette plassering og filnavn til rapportfil.
:: Her kan du skrive inn din egen om du ønsker det. Plasseringen som blir brukt er en som er samme sted
:: som scriptet kjøres fra. Lag deg gjerne en mappe på skrivebordet med md minmappe, bruk cd minmappe
:: for å gå til mappen og plasser scriptet i denne mappen. Da kan rapporten haven i samme mappe.
:: Til slutt kan en se på filen / rapporten med f.eks. notepad.
@set outfile=".\filrep.txt" 

@echo.
@echo   Valgt IP-omraade er: %currentiprange%.1 - 255
:: Linjene over lager "variabler" og benytter de. Det er %-tegnene som viser om en variabel tas i bruk.
:: Det er flere versjoner av %-bruk. Eks. %1, %a, %%A og %variabel% er ulike måter en kan benytte en variabel
:: Søk på nett om du lurer på hvordan de brukes eller følge med videre i dette scriptet.
:: echo =========================== =========================== ======================
@prompt $H
@echo =========================== =========================== ======================
@echo .
echo Forste del vises dobbelt da echo ikke er off. Linjene som setter 
@echo off
echo IP-adresser vises ogsaa, men ikke dobbelt da disse vanligvis er "usynlige". 
echo.
echo Linjen med @echo off bor vaere foer forste linje som viser innhold paa skjerm.

@prompt $P$G
:: @echo off


echo Kommandoen set iprange2=192.168.1 er egentlig usynlig, men echo viser den.
echo Dersom echo er slaatt av maa alt som skal vises paa skjerm sendes til skjerm.
echo Derfor kan en midlertidig slaa paa med echo on og saa kan en deretter 
echo slaa av med @echo off om en onsker det.
echo =========================== =========================== ======================
echo.
echo Naa er alt bedre. Klar for neste del? Bli kjent med @-"kommandoen"
echo echo er slaatt av og @ foran echo off gjor at denne linjen ikke vises.
echo Alle linjer slik som @prompt, @set vises heller ikke pga. @-tegnet.
echo.
:: echo er slaatt av og @ gjor at ikke linjen med echo off vises.
echo Kommandoen echo. maa skrives slik echo. da echo . skriver ut et . paa skjerm.
echo echo. kommandoen lager en ny tom linje, som du sikkert allerede har sett.
:: echo.
echo.

goto info
:: Hopp over ECHORED i denne omgang. En kan hoppe tilbake om en ønsker det.
:: Kommandoen goto kan hoppe dit en label finnes og dette gjør den uoversiktlig.
:: I andre programmeringsspråk enn cmd / bash benyttes ikke goto i særlig grad, 
:: selv om kommandoen finnes. En av grunnene er at det kan hoppes fram og tilbake i koden
:: "ukontrollert".
:: :: Er på et vis en label, en tom label, siden det ikke finnes et ord etter :
:: En label starter slik :label og goto label er måten den benyttes. goto info er et eksempel
:: på å hoppe til dere en label finnes i koden. NB pass på å ikke ha samme label flere steder.

CALL:ECHORED "Print me in red!"
:ECHORED
%Windir%\System32\WindowsPowerShell\v1.0\Powershell.exe write-host -foregroundcolor Red %1
goto:eof

:: CALL:
:DarkYellowINFO
%Windir%\System32\WindowsPowerShell\v1.0\Powershell.exe write-host -foregroundcolor DarkYellow %1
goto:eof

:: Det er nå hoppet til info eller dersom ::goto info er satt så skjer det noe annet

:info

echo.
echo =========================== =========================== ======================
echo Her kommer det en pause i "programmet". med CTRL+C kan du avbryte, eller du 
echo kan trykke en tast for aa gaa videre. Dersom du gaar videre kommer 
echo velkommstskjermen til ping. Skjermen renskes foer bruk saa se paa det over
echo en gang til om du lurer paa noe. Kommandoen pause ">" nul
echo hindrer en i aa se ordet pause, saa vaer forsiktig med for mange slike,
echo da det er lett aa utfore noe utilsiktet. Neste pause skjules ikke.
echo =========================== =========================== ======================

:: Nå er det på tide å ordne opp i prompt slik at denne er ok om programmet krasjer
prompt $p$g
:: pause
pause > nul


cls
echo.
echo.
echo =========================== =========================== ======================
echo.
echo Velkommen til mulitiping.
:: Det er først nå selve programmet starter, slik at det meste over, med unntak av å 
:: sette variabler med set-kommandoen og echo off kan gjernes. En annen verjon er med mye mindre kommentarer.
echo.
echo Dette "programmet" utforer ping til en IP-range og starter paa 
echo IP-adresse %currentiprange%.1 og slutter paa %currentiprange%.255 som er broadcast BC.
echo.
:: Se senere i "programmet" der findstr leter etter "TTL="
echo Alle IP-adresser som er i bruk vises siden disse svarer med Reply og TTL.

echo Det kan vaere noen svakheter i filtreringen. Om det er tilfellet skriv 
echo manuelt i kommandovinduet og se noe som er unikt for adresser som svarer 
echo og de som ikke svarer: (Kopier gjerne linjen under for aa teste)
echo.
echo      ping %currentiprange%.1 -n 1


:: goto under sparer en for å kommentere alle linjene under som ville gitt feilmeldinger
:: Feilmeldingene er siden dette ikke er gyldige kommandoenr. Tenkte å vise hvordan ping svarer
:: Når en er i Windows 10, og er lei av å kommentere med ::. I tillegg er dette kopie fra skjermutskrift.
:: slik det presenteres på egen maskin. LEs på nett eller skiirv ping /? for å få litt innblikk i det som vises.
goto hopp01
ping 192.168.1.1 -n 1

Pinging 192.168.1.1 with 32 bytes of data:
Reply from 192.168.1.1: bytes=32 time<1ms TTL=64 :: Det er denne linjen det testes på senere

Ping statistics for 192.168.1.1:
    Packets: Sent = 1, Received = 1, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 0ms, Maximum = 0ms, Average = 0ms

:hopp01
echo.
echo Programmet velger ping kun en gang mot hver IP og naturligvis maa enhet med gitt 
echo IP svare paa ping. Flere detaljer kan hindre svar, blant annet brannmur.
echo.
echo Listen skal hjelpe deg aa finne "gyldige" IP, og en kunne snudd om paa testen 
echo og vist alle IP-adresser som ikke svarer. (Reply og TTL)
echo.
:: Linjen under er kommentert bort slik at en kan se powershell i aksjon
:: 
:: echo Dette eksempelet paa et script / "program" er "ufarlig" og kjorer i CMD. 
:: Om det ikke virker så ta bort linjen under med :: og ta bort de to kolon på linjen over.
call:DarkYellowINFO "Dette eksempelet paa et script / "program" er 'ufarlig' og kjorer i CMD."
echo Det er mulig aa endre smaa deler av det slik at det ogsaa virker i linux. 
echo Et liknende script er faktisk tatt med paa cliogkode-nettstedet under bash01.sh.
echo.
echo Kommandoen call benyttes naar en vil hente noe fra et annet program, 
echo Det kan vaere en annen cmd-fil eller som her powershell. NB Husk goto:eof.
echo.

goto ping



REM updates git local windows copy Legg merke til REM er benyttet og ikke ;;
REM Om hele filen hadde benyttet REM istedenfor :: kunne den blitt tregere.
REM Les på nett om årsaken til det. REM utfører hele linjen, selv om det er en kommentar.
:: på den annen side utfører de to tegnene og går videre, uansett hvor mye mer som er på linjen.
:: Det kan hende dette ikke gjelder lenger siden maskiner er mye raskere enn på 80 og 90 tallet, men det skader ikke å alltid benytte ::, spesielt når linjen blir altfor lange og ikke kan vise s på en linje om editor er satt opp til å bryte av lange linjer ...
:: Eksempelet under viser noen kommandoer om en bruker git.
:: Teknisk sett kunne kommandoen ha lagt til siste versjon av dette scriptet
:: Hver gang det kjøres og det er endret på. goto ping hopper over denne delen
:: Det er med siden kanskje bruker selv vil benytte linjene under tilpasset eget bruk.
@echo off
:STARTGIT
:: cls
echo.
echo Git will update from the current version:
echo.
:: git --version
echo.
:: Her benyttes ESC-kommandoer, for å leke litt met farger. Slik gjorde en det før powershell
:: Det som krevdes for at ESC-kommandoer skulle virke var ANSI. $P$E er en annen måte å benytte ESC-kommandoer
:: Les mer om ESC-kommandoer med  help og prompt /? og les enda mer på nett. Det finnes mengder sv script som leker
:: med ESC-kommandoer. set /? gir også hjelp om dette.
set /p DUMMY=^[97mHit ENTER to continue...^[0m
echo.
:: git update-git-for-windows
echo.
set /p DUMMY=^[92mDone, Hit ENTER to continue...^[0m
:: updates my git install on windows.


:ping
echo =========================== =========================== ======================
echo Naa er siste sjanse aa avbryte med CTRL+C om du ikke vil kjore "programmet"

echo Dersom du gaar videre starter ping med en og en adresse til det er ferdig. 
echo Dette skrives til en rapport, som er plassert samme sted som programmet.
echo Det kan endres ved aa endre variabelen outfile som naa peker til:
prompt $p$g
echo %cd%\%outfile%
echo.
echo Pass paa %outfile%med katalogplassering er et gyldig 
echo sted der du har skriverettigheter.
pause


echo Start ping: > %outfile%
date /t >> %outfile%
time /t >> %outfile%
:: Test med kun 4 adresser. Om ingen adresser svarer så tar det minst 250 sekunder å kjøre gjennom
:: dersom en tester med alle adressene 1 - 255
REM FOR /L %%A IN (1,1,4)   DO ( ping -n 1 192.168.0.1 |find /i "Repl" ) 

:: For å få hjelp med for-løkke i batch skriv for /?
:: Her er en "kort forklaring". %% må benyttes med variabler i for-løkker som kjører i en batchfil.
:: Dersom en dropper dette får en feilmelding. /L er en liste med verdier, tall annet. (1,1,4) er listen under

:: FOR /L %%v IN (1,2,8) DO ( kommando) er basisoppsettet til en forløkke som utfører noe 4 ganger, 1, 3, 5, 7 siden steg er satt til 2.
:: Test denne i cmd kommandovinduet (NB ta bort :: foran FOR-kommandoen. og ja for, FOR, fOR FoR er det samme)
:: FOR /L %v IN (1,2,8) DO ( @echo %v)

:: Legg merke til kun en % er med. Når en IKKE bruker FOR i batch-fil da må en benytte kun en %
:: Om en blander dette får en feilmelding både i batchfil og i cmd-vinduet. Dette er en begrensing i for-løkke i batchprogrammering.

:: pause

::ping folk.ntnu.no -a -n 1 -4 |findstr /I /N /O /A:f1 /C:"TTL="
:: set pingkommando='echo ping folk.ntnu.no -a -n 1 -4 |findstr /I /N /O /A:f1 /C:"TTL="'

:: Da skal endelig kommandoen kjøres alt over er kun forberedelse til denne ene linjen med kode
:: Først en echo til skjerm / rapport for å simulere / vise hvilke adresser som det utføres ping mot.
:: Deretter kjøres selve ping med alle parameter som er valgt. skriv ping /?, find /? og findstr /? for alle detaljer

:: Kun til bruk i CMD (kun ett %-tegn)
:: FOR /L %A IN (1,1,5) DO ( ping -a -n 1 -4 %currentiprange%.%A |findstr /I /N /O /A:f1 /C:"TTL=")
echo.
echo Ping av IP-adresser er i gang. Alt sendes til rapportfil saa det vises ikke noe paa skjerm.
echo Det tar ca 3 minutt foer programmet er ferdig med alle IP-adressene.
echo.
FOR /L %%A IN (1,1,255) DO ( ping -a -n 1 -4 %currentiprange%.%%A |findstr /I /N /O /A:f1 /C:"TTL=" >> %outfile%  )
echo.  >> %outfile%
:: pause
:: FOR /L %%A IN (1,1,255) DO ( echo ping -n 1 %currentiprange%.%%A >> %outfile%  )
:: FOR /L %%A IN (1,1,255) DO ( ping -n 1 129.241.56.%%A |find /i "TTL"  >> %outfile%  )

echo.  >> %outfile%
echo End ping: >> %outfile%
date /t >> %outfile%
time /t >> %outfile%
echo end PiNg
goto end
pause


:: Ikke kommennter det under. hopp over istededenfor med en goto - linje
goto hoppover



@echo on
her er noe som ikke virker. echo mangler foran linjen
dir \ /s /a /b :: vil vise mye data paa skjerm og kunne vaert kommentert bort
istedenfor brukes goto en label som er under denne delen
Dette gjor at en slippper a kommentere alle linjene
sett :: foran goto hoppover saa kan du se alle feilene som dukker opp.
i tillegg blir den en lang pause mens du venter paa dir skal bli ferdig
I de fleste programspår er det ikke mulig å ha slike skrivefeil, men med batch og 
goto er det fullt mulig. Årsaken det er mulig er at batch utfører en og en linje 
og ikke vet om linjer som ikke utføres.
en evig løkke ville vært slik: NB :: er foran for å "uskadeliggjre linjene", 
men strengt tatt siden en aldri havener i denne blokken kan det tas bort.
:: label :evig
:: echo du ar naa i en "evig" loekke. Om denne innheoldt 
:: kode som fyller RAM ville datamaskin foer eller siden "krasjet"
:: goto evig


:hoppover
:: så da slapp en å kommentere alle linjene over.
:: Om en vil gjøre de så legg til :: foran goto hoppover ...
:: NB alltid lurt å ha en :end til slutt i alle script.
:end
prompt $p$g
echo end program


:: NB resten er kun med litt lenker og annet som er kjekt å vite om. Noe av det ble benyttet i å skrive dette programmet.
:: Det meste ble oppdaget i forbindelse med prosjektet og har lite med det endelige resultatet å gjøre.
:: Derfor er ingenting av det med som referanser. Tenkte likevel det ville være greit å ta med for egene del.
:: Vet jo ikke om en finner smme informasjon igjen en annen gang.
:: Helt nederst er det kommentert bort hvordan batch lager EXIT-code når programmet fullføres OK eller ikke.
:: Disse linjene er nå kommentert bort, slik at de ikke er aktive. F.eks. kunne de styrt hvordan et CMD-vindu oppfører seg, 
:: om et annet progam kan ta i mot feilmeldinger o.l.
::
:: https://ss64.com/nt/syntax-esc.html
:: https://docs.microsoft.com/en-gb/archive/blogs/myocom/making-your-scripts-look-prettier
:: https://ss64.com/ps/syntax-esc.html
:: Litt historikk omrking \, / og escape-tegn
:: DOS 1.0 fra CPM, fra Dirty DOS fra ...
:: Slike ting er fortsatt med og preger dagens system, snart 40 år etter noen kom på ideen.
:: Noen ganger overlever dårlige ideer, selv nnår de som valgte de visste bedre og ønsket å gjøre noe annet.
:: Desverre må noen som har bestemt tatt noen avgjørelser, slik at det som var / er teknisk mulig ble "umuliggjort"
:: https://web.archive.org/web/20100612035120/http://blogs.msdn.com/b/larryosterman/archive/2005/06/24/432386.aspx
:: https://web.archive.org/web/20100612035120/http://www.iso.port.ac.uk/~mike/interests/chistory/documents/cpm-22-manual/
:: \ er ofte escape-tegn
:: i cmd er det istedenfor tegnet ^ som brukes
:: På samme måte som \\ lar en bruke tegnet \ så er det ^^ som lar en bruke tegnet ^
:: https://github.com/adoxa/ansicon
:: https://www.dostips.com/forum/viewtopic.php?f=3&t=4453

:: Så la oss leke litt og bruke noen farger da er escaping essensielt. Tegnet er asciitegn nr 27 
:: og ANSI og ASCII-tabeller er like for de 127 første tegnen, så dette skal gå greit
:: https://ss64.com/nt/syntax-ansi.html

:: https://stackoverflow.com/questions/2048509/how-to-echo-with-different-colors-in-the-windows-command-line
:: https://stackoverflow.com/questions/2048509/how-to-echo-with-different-colors-in-the-windows-command-line DEnne har mange forslag, 
:: spesielt i kommentarfeltene til slutt bruke prompt istedenfor echo om alt feiler. $e er echio i prompt (kommentar fra PavDub og Jeb)
:: https://www.codeproject.com/Articles/17033/Add-Colors-to-Batch-Files
:: Et fargekart: https://gist.github.com/mlocati/fdabcaeb8071d5c75a2d51712db24011#file-win10colors-cmd
:: Last ned fil og test den den bruker en rekke echo-linjer med en foor-loop og er prettymuch ufarlig.


:: wget, curl for linux har winget install --id=Microsoft.WindowsTerminal -e for windows.
:: https://github.com/microsoft/Terminal
:: https://en.wikipedia.org/wiki/ANSI_escape_code
:: https://devblogs.microsoft.com/commandline/24-bit-color-in-the-windows-console/
:: https://github.com/microsoft

::  og ^[ er esc-sekvens Egentlig skulle bildet vært en pil som peker oppover, men detter gjør samme nytten.

:: for /l (1,255,1) do
::   ping -n 1 192.168.1.1
:: end
:: 

:: echo ^<?xml version="1.0" encoding="utf-8" ?^> > myfile.xml
:: Avanserte greier echo ^<?xml version="1.0" encoding="utf-8" ?^> > myfile2.xml

:: Dobbel kolon : fungerer som REM, og blir det mange nok av de så er REM mye tregere. REM er MS sin mekanisme for kommentarer og betyr REMark
:: Enkel kolon : fungerer som en label og en bruker got navn på label for å gå dit, mens :: er en label til seg selv: til : og så gå 
:: videre. Dette er egentlig et "udokumentert" triks som "alle" vet

:: by the way les dok om kommandoen set, prompt, og echo. Alle disse støtter former for ESC-sekvenser.
:: You can generate an ESC character in a Batch file this way: for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
:: https://stackoverflow.com/questions/2048509/how-to-echo-with-different-colors-in-the-windows-command-line
:: echo ^[[32m HI ^[[0m
:: https://en.wikipedia.org/wiki/ANSI_escape_code#Colors



REM :showerrors
:: Et eksempel på bruk av EXIT-code. LEs på nett om script som benytter dette mye. En bør alltid ta det med
:: i seriøse script, slik at en kan kontrollere både feilmeldinger og hva som skal skje i ulike tilfeller.
REM echo.
REM echo ==============================================================================================================
REM echo.
REM IF %ERRORLEVEL% ==  0 echo Avslutter: %ERRORLEVEL% Feilkode = 0 betyr alt er OK
REM IF %ERRORLEVEL% == -1 echo Avslutter: %ERRORLEVEL% Feilkode = -1 betyr noe gikk galt underveis.
REM 
REM EXIT /B %ERRORLEVEL% :: En kan avslutte programmet og returnere koden
```
