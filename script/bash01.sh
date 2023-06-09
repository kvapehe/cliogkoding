#!/bin/bash
# Filename: fil2.sh

INTERFACE=wlan0

echo
echo
echo ================================================================================================================
echo Da skulle du være klar for et \"litt\" større program. Bash i linux er en del kratigere enn cmd og batch
echo i Windows. Powershell endrer noe på dette. Studer kildekoden og test programmet.
echo Mange av de tipsene og den kunnskapen du nå har fått er oppsummert i dette programmet.
echo
echo ================================================================================================================
echo Benytt cat /proc/net/dev for å se nettverkskortene du har tilgjengelig.
echo Dersom du har WiFi / wlan så er kanskje navnent wlan0. Med et nettverkskort med kabel er navnet muligens eth0.
echo
echo La oss ta det et steg videre
echo Kilde: https://dev.to/cloudx/build-a-network-speed-monitor-in-bash-with-awk-1pga
echo Nå er det enda en nyttig kommando i bash som benyttes, og det er awk
echo ================================================================================================================
echo
echo Nå håper jeg du er vant med å lese hjelp siden man awk wil gi litt hjelp.
echo Programmene awk og sed er langt mer avansert enn f.eks. wc og cut og her brukes kunnskap om at på linux er alt en fil.
echo cat /proc/cpuinfo viser all mulig infomrasjon om prosessoren i din datamaskin som om det var en fil / et dokument.
echo
echo I Windows finnes det liknende kommandoer, msinfo32 er en slik kommando.

echo
echo "Uansett studer kommandoen(e) under for å se hva den gjør. NB CTRL+C avbryter en kommando."
echo Du må naturligvis åpne kildekoden, og ikke bare kjøre kommanden.
echo Kommandoen kan kjøres på flere måter. Dersom du har endret scriptet med chmod +x fil.sh kan det kjøres som et program,
echo alternativt kan du skrive bash foran kommandoen slik. bash ./fil.sh
echo

echo  ================================================================================================
echo "Hastighet for nettverkskortet: $INTERFACE"
echo "CTRL+C avbryter en kommando."
echo ==================================================================================================

echo "║  Down (KiB/s)  | Up (KiB/s)    | Dn Bytes/sec  | Up Bytes/sec  |  Dn bits/sec  | Up bps        ║" 
echo "║================|===============|===============|===============|===============|===============║"

while :
do
  awk '{
  if (rx) {
    # Denne er kommentert bort, da en litt mer avansert er vist under. Ta bort kommentar og for å se linjen.
    # printf ("\t  %.0f\t    %.0f\n", ($2-rx)/1024, ($10-tx)/1024)

    printf ("║\t%.0f\t|\t%.0f\t|\t%.0f\t|\t%.0f\t|\t%.0f\t|\t%.0f\t ║\n", \
      ($2-rx)/1024,  ($10-tx)/1024, \
      ($2-rx), ($10-tx), \
      ($2-rx)*8,  ($10-tx)*8 \
      )
    

  } else {
    rx=$2; tx=$10;
  }
}' \
    <(grep $INTERFACE /proc/net/dev) \
    <(sleep 1; grep $INTERFACE /proc/net/dev)
  sleep 2;
done

echo Her kommer aldri programmet da en evig while-løkke er benyttet over.
echo Her kan en derfor legge inn all mulig annen informsjon om en ønsker.
echo "Noen ganger benyttes \" Og det er når kommandoer kan ha mellomrom eller spesielle tegn."
echo en annen nyttig kommando:  cat /proc/net/arp 

echo -e "GET http://vikinc.net HTTP/1.0\n\n" | nc vikinc.net 80
