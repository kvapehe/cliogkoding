@echo off
:: Forklaringer på ulike teng og kode er til slutt i programmet. Det sparer en for litt unødige kommentarer underveis.

echo.
echo Dette programmet leter etter det du ønsker. (NB norske tegn er ikke lurt)
echo Det vil så åpne et dokument med det som er funnet og plasseringen på maskinen.
echo Det er noen begrensinger i programmet. Bla må deu velge stedet det skal søkes fra, og 
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
echo aarsaken til resultatet er at f3 finnes et sted i de tre ekemplene ogver og derfor maa en vaere presis i det en leter etter.
echo Legg merke til norske tegn naa er ungaatt, og maate aa gjoere dette er aa kun skrive paa engelsk, siden det norske spraaket
echo bruker det tre siste tegne i alfabetet i stor grad.
echo Hei %arg1% og %arg2%
goto showerrors

:start
:: 
rem Her starter programmet. REM er kommentar og cmd eller .bat skiller ikke mellom store eller smaa bokstaver.
rem Magiske tegn :: er an label som gjør at en kan hoope i koden. Dette er ikke bra programmeringsskikk i programspråk slik som c++ eller python, 
rem men for batch-programmering
rem er dette en av få muligheter en har til å lage programstruktur / logikk.
rem bør unngåd siden da leses hele linjen til endes og det er ikke nødvendig med kommentarer- Ved å benytte ::
:: unngår en å lese hele linjen, og programmet blir mye raskere. Om en vil teste dette selv så lag et program med 1 million linjer.
:: sett rem foran hver kommentar, og lage en versjon med :: istedenfor rem. Da vil en se en mangedobling av hastigheten programmet kjører.
:: Legg merke til Æ ø Å er benyttet nå når det er kommentarer. Disse linjen vises ikke, og en må redigere filen for å se de.

echo Her er din kommando:
echo "dir %arg1% /s /b /a %arg2% |findstr "%arg2%" "
dir %arg1% /b /a %arg2% |findstr "%arg2%"
echo Data: dir %arg1% /s /b /a %arg2% |findstr "%arg2%"
goto end




:end
goto veryend
:: Det er alltid lurt å savlutte et program med en avslutting som :end. Dette er en label det hoppes til,
:: I denne kan en lage noe som kaalles returkode eller errorlevel.kode eller exit-kode.
rem Det fleste program returnerer 0 når alt går bra. -1 om noe gikk galt og et annet tall om en ønsker det.
:: På den måten kan en styre hva som skjer etter programmet er utført.
:: F.eks. er det ingen grun å åpne fil i notepad dersom noe gikk galt. Da blir filen tom og får et navn.


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
set ERRORLEVEL=0
:: echo %ERRORLEVEL%
:: exit %ERRORLEVEL%

:showerrors
echo %ERRORLEVEL%
