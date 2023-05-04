ps aux |grep chrom  
# Noen lenker
https://duckduckgo.com/?q=bash+internet+speed+test&t=ffab&ia=web  
https://askubuntu.com/questions/104755/how-to-check-internet-speed-via-terminal  
https://phoenixnap.com/kb/linux-network-speed-test  
https://stackoverflow.com/questions/929368/how-to-test-an-internet-connection-with-bash  
https://dev.to/cloudx/build-a-network-speed-monitor-in-bash-with-awk-1pga (En framgangsmåte å lage et "program"  
https://itsfoss.com/network-speed-monitor-linux/  
https://stackoverflow.com/questions/929368/how-to-test-an-internet-connection-with-bash  
https://opensource.com/article/20/1/internet-speed-tests Tips til lnettsider med info  


# Fil 01 info
# SQi
https://duckduckgo.com/?t=ffab&q=network+speed+bash+script&ia=web
network speed bash script

1. https://duckduckgo.com/?q=bash+internet+speed+test&t=ffab&ia=web
1. bash internet speed test
2. https://askubuntu.com/questions/104755/how-to-check-internet-speed-via-terminal (diskusjon med mange tips)
1.1 wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip
1.2  
curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -

Mange tips her:
https://stackoverflow.com/questions/929368/how-to-test-an-internet-connection-with-bash

# Andre metoder:
Phoenixnap home contact support blog Glossary 
How to Test Network Speed in Linux via CLI ( 9 verktøy )
https://phoenixnap.com/kb/linux-network-speed-test

I CMD kan en f.eks sjekke om en router er klar ved å utføre en rekke kommandoer.
HEr er noen eksempler.
ipconfig -a og så lete etter GW
deretter ping denne.
Både cmd og shell forstår | som er et rør med kommando til en annen kommando.
I lunx er dette tatt hele veien
Med kommandoen $(ls) så utfører en ikke bare kommandoen, men det er det som blir rsulatet av denne som kommer ut.
med echo og så ls inni en slik "variabel" får en ut alle filene som ls viser og som igjen kan benyttes til neste kommando.
la oss si en vil finne og utføre alle .sh filer i en mappe.
da kan en benytte ls og finne disse slik ls *.sh, deretter kjøre en og en kommando.
Dersom en gjør det slik: $(ls *.sh) så finner ls .sh-filer, deretter utføres en og en fil.
Hvor nyttig dette er, bestemmer brukerene.
Men la os nå se på den utvidede ping-kommandoen som sier om noe er router ut til internett er klar eller ikke.
Denne kompliserte kommandoen oppsummerer mye av det en har lært om batch og bash-"progrramering"
ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo "OK Router er aktiv" || echo Feil router er nede"
ping -q -w 1 -c 1 $(ip r | grep default | cut -d ' ' -f 3) > /dev/null && echo OK Router er aktiv || echo "Feil router er nede"
ping -q -w 1 -c 1 $(ip r | grep default | cut -d ' ' -f 3) && echo OK Router er aktiv || echo "Feil router er nede"

Kommandoen ip a viser egene IP-adresse.
ip r viser routers IP-adresse.
ping denne IP-adressen viser om enhet svarer eller ikke.
Men la os heller lage en noe som kan se gjennom flere IP-adresser og si OK om alt er ok og FAIL om enhet feiler.

echo $(ip r | grep default | cut -d ' ' -f 3)
Dette må forkares nærmere, og ikke alt virker i CMD 
ip r kan en finne slik rout -print
grep kan erstattes med |find eller | findstr, mens cut ikke finnes i cmd.
Derimot kan en laste ned fra nett ulike kommandoer som likner på dette.
findstr med ekstraparameter i CMD kan klare noe liknende, og Powershell er i stand til noe tilsvarende.
MEn tilbake til kommandoen
$(ip r | grep default | cut -d ' ' -f 3)
cut -d leter etter mellomrom i strengen fra $(ip r | grep default
som i dette tilfellet er: default via 192.168.1.1 dev wlan0 proto dhcp src 192.168.1.120 metric 303
-f 3 velger ut feltet nr 3 som nå er: 192.168.1.1 (dette er IP-adressen til router på dette nettverket din kan være noe helt annet)

