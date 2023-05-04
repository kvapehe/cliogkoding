# Dette er et litt interessant eksperiment.

Til nå har alle rapporter og annet innhold blitt skrevet i f.ek.s odf eller .docx.  
Nå vil jeg prøve å skrive dokumentet i markdown, for å se hva som er mulig  

Tanken er at dette kan konverteres til Word om det er påkrtrevet.

Det kan hende det er vnaskelig å llage innholdsfortegnelse med markdow, men tror det askal være mulig.

Hvorfor gjøre det slik, vel det er en innleveringsfrist 2023-05-05 som skal overholdes. Der legges det inn en
zip-fil med alt innhold, og så er det tanken å referere til dette stedet, slik at en evt kan bruke filen som er levert, til å peke hit.

Her vil dokumentene, script, annet innhold bli kontinuerlig vedlikeholdt, enten dette er pga skrivefeil, eller nye ideer.
Det kan hendee det bryter med retningslinjene for innleveringe, så naturligvis finnes det et statisk dokument i tilleg,

# Årsaken til å velg CLI er at det ville være gøy å vise elever dette
Det er altfor mange elever som ikke kan bruke tekstverktøy med en datamskin, på tross av at dette de siste 50 årene er
det foretrkne verktøye for alle som aktivt jobber med en datamaskin. For å utdype dette litt må en definere hva en datamaskin er.

## Datamaskin
En datamaskin er en enehet som har programvare laste inn på maskinen, detn har en mikroprosesser i motsetning til en mikrokontroller.  
Les på nett om denne forskjellen. Datamskinen ar minnetilgang og et lagringsoråde. Siden den har tilgang til slike resurser er naturlig   
neste steg at maskinen har et operativsystem.
# Operativsystem
Operativsystem eller OS, er en litt uklar definisjon. At et operativsystem er MS DOS er kjent, at et annet er Windows er også delvis kjent, 
men hvilket system bruker f.eks. en maski fra Machintosh. OSX er mer uklart som operativsystem det samme er IOS på Apple telefoner,
men alle regnes som operativsystemer. For å gjøre det enda mer uklart så har en ordet linux som er et delvis ordspill på Uni(ik) / Min(IX)
og opprinnelig forfatter Linus Torvalds fra Finland. Dette er ikke et operativsystem, selv om en liker å kalle det det.

Linux er i grunn kun kjenrne i operativsystemet og på den måten kun en liten del, men delen er så sentral og vikig at en har latt det bli 
"navnet" på et operativsystem. Med linux snakker en mer om distribusjoner, og Debian, Ubuntu, Android, Mint, Mandrake ... er alle former for linux-distribusjoner.

Når en da drar i begrepet operativsystem er det enda vanskeligere å fortelle hva CLI er. NB for mye mer omkring dette søk på nett etter kilder.
Ofte når jeg skirver dette er et godt utgangspunkt Wikipedia fra Wikimedia Foundations. På denne mpten unngår jeg å referere knstant til steder.
Tnakene er å være så presis i ordlyden at en kan velge to - tre av ordene og utføre et søk og at en da skal hanvne på rett sted. Prø f.eks. med et søk på 
Wikimedia foundations og det skal kun dukke opp en reeel og original kilde. NB testet 2023-05-04 for å se selv.

# CLI eller Command Line Interface
CLI eller på norsk kommandolinjegrensesnitt er et langt og komplisert ord. 
Dette er en fellesbetegnelse på tvers av enehter, datamaskiner, switcher, routere, smartklokker, telefoner og alt mulig annet som har eller kan ha et operativsystem.
Det som er oppgaven til CLI er å kunne ta i bruk tekstskrvne kommandoer (oftest på engels om med delvis engelske ord) og så gjøre dette om til handling.
Selv handlingen kan være "lik" på ulike Operativsystemer (OS), mens kommandoen kan være ulik.

Et eksempel kommandoen for å lage en mappe i CMD/BATCH brukt av bla. Windows er md eller mkdir. I linuxsystemer og også i Unix-systemer er den samme kommandoen mkdir.  
Mao ulik kommmandon, men lik handling. Kommandoen cd finnes både i linux og cmd. CMD er videreutviking av MS DOS, og dukket kun opp å Windows NT på 90-tallet.
CMD var fra utgangspunktet 32 bit mens batch stoppet på 16 bit. I dag er systemene på linux og Windows 64 bint, men svært mange kommandoer er fortsatt 32 bit.
Det er først med Powershell Microsoft er på vei bort fra 32 bit, og hele Windowssstemet er gjennomsyret av 32-bit pgrammer og kommandoer.
Da 16 bit var i bruk fantes det i tillegg til CMD noe som heter .com, og .com er en forkortles for kommando. Denne kommandoen kjøres direkte i minne og kunne i grun utføre alt mulig.
Så vanlig var com at CLI på den tiden het command.com. I dag er dennne erstattet med cmd.exe, og det er dennne endringen som har ført til det i dag heter cmd i Windows.

# Filosofi om bakoverkmopatibilitet
Det er sjelden Microsoft gjør noe uten at det på et vis skal virke med noe som var tidligere, og i CLI er dette forsøket eller handlingen at kommandofiler har etternavnent .bat,
og at 32-bit versjonen har .cmd. Nå med Windows 10 og Windows 11 er strengt tatt .bat ute av verden, men det virker fortsatt. .bat er strengt tatt kun 16 bit, men her "ser Windows litt gjennom fingrene med det.
Det er .-bat som er brunnen til det heter batch-filer o, batch script og batch-programmering. Du anbefales likevel å kalle alle dinne batch-programmer .cmd, for plutselig slutter .bat å vuirke.

I linux så brukes det ofte sh(ell) eller bash(ell) og søk på internett ffor hva bash egentlig betyr. DEt er et mål å ha denne oppgaven så kort som mulig om eksterne detaljer, og heller ikke lenke til evt. slike
for å holde mengden noenlunde i sjakk.
I linux finnes det en rekke andre metoder enn bash som csh, zsh, ksh, sh, bash og nok en lang rekke andre. Mellom de ulike shell (sh betyr shell) og bash er en fomr for shell så er det mye som er likt, og s er noen detaljer ulik.
F.eks. med csh ligger det c og c++ i bunn så her kan en nesten skrive c-kode direkte i shell og så virker det. med .cmd er det langt "vanskeligere eller mer omstendelig å skrive kode i shell eller cli.

# Historie
Mange av de ulike CLI har lang historie, og prøver å alltid være bakoverkompatible. Med linux er det lettere å forlate en mtode fra tidligere når det finnes en "ny og bedre" metode.
et

