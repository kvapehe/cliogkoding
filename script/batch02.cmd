@echo off
:: Forklaringer på ulike linjer i kode er til slutt i programmet. Det sparer en for litt unødige kommentarer underveis.
:: Ved å se på alle eksemplene vil en se mye kodelinjer er like og på den måte forstå hva koden gjør.

echo.
echo ==============================================================================================================
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
set arg3=%3
:: if %arg1% == "" 
if [%1]==[] goto usage
if [%2]==[] goto usage
if [%3]==[] goto usage
:: if [%arg2]==[] (goto usage) :: (goto usage)
::if %arg2% == "" (goto usage)
goto start

:: C:\Users\bruker
:usage
echo ==============================================================================================================
echo. 
echo Eksempel paa bruk:
echo Pass paa det er minst et mellomrom mellom hvert argument.
echo Det er tre parameter. Forste er plassering, andre er filnavn eller * og det tredje er del av filnavn.
echo.
echo Eksempel " dir ..\ /s /b /a *f3*.tx* |findstr "f3" "
echo Returnerer kanskje dette:
echo C:\Users\elev1\.arduino-create\arduino\windows-drivers\1.8.0\drivers\.git\objects\40\af396a0ea3c0919709e49a9d343514988f7e26.tx
echo C:\Users\elev1\.arduino-create\arduino\windows-drivers\1.8.0\drivers\.git\objects\41\a890d1131ef889b772d86c5c4d1803bea0df3c.tx2
echo C:\Users\elev1\.arduino-create\arduino\windows-drivers\1.8.0\drivers\.git\objects\45\4de03e94366ab70843abf5f9f3056b84f6fb9c.txt
echo i tillegg til det en leter etter f3.txt
echo C:\Users\elev1\f3.txt
echo.
echo Aarsaken til resultatet er at teksten f3 finnes et sted i de tre ekemplene over og derfor maa en vaere presis med det en leter etter.
echo Legg merke til norske tegn naa er unngaatt, og maate aa gjoere dette er aa kun skrive paa engelsk, siden det norske spraaket
echo bruker de tre siste tegnene i alfabetet i stor grad.
echo Her er argumentene du skrev inn: %arg1%, %arg2% og %arg2%

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
:: Kanskje dette er rettet med W11.

echo Her er din kommando:
echo Plassering: '%arg1%' filnavn '%arg2%' med evt * foran og bak sokeordet og detaljert del av filnavn '%arg3%'
echo "dir %arg1%%arg2% /s /b /a  |findstr "%arg3%" "
echo on
dir %arg1%%arg2% /s /b /a  |findstr "%arg3%"
@echo off
echo "Data: dir %arg1%%arg2% /s /b /a |findstr "%arg3%" "
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
:: Når programmet som kjøres er avsluttet kan dette returnere ERRORLEVEL og så kan dette programmet som benyttet call fil.cmd teste på hva koden viser.
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
:: Poenget med en slik slutt er å renske kode og rydde i evt. variabler og utskrift til filsystemet, skjerm eller evt skriver.

set ERRORLEVEL=0
:: echo %ERRORLEVEL%
:: exit %ERRORLEVEL%
:: veryend nullstiller nå variabel og kode. Du kna gjerne vise den med echo, da fjerner du de to :: foran echo.
:: Å bruke print til skjerm er en velkjent feilsøkingsmetode en alltid bør benytte.

:showerrors
echo.
echo ==============================================================================================================
echo.
IF %ERRORLEVEL% ==  0 echo Avslutter: %ERRORLEVEL% Feilkode = 0 betyr alt er OK
IF %ERRORLEVEL% == -1 echo Avslutter: %ERRORLEVEL% Feilkode = -1 betyr noe gikk galt underveis.

EXIT /B %ERRORLEVEL% :: En kan avslutte programmet og returnere koden
