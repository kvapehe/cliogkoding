# Intensjonen med dokumentet
Her vises noen eksempler og litt annet. Denne siden er kun tatt med for å vise noe kode,
uten at en må lese alle de andre sidene.
## Navigasjon
### Tilbake til toppen
- [Hovedsiden](../README.md)
### Innlevering
- [Innlevering](./innlevering001.md)
- [Innlevering del 2] *
### Scripteksempler
- [Script](../script/README.md)

I dette dokumentet er tanken å vise en del kommandoer , fra de helt enkle til mer avanserte.
I tillegg er det eksperiment med markdown som  kanksje også kan inspirere elever til å "programmere" ren tekst. Det som er fint med markdown er at dette er ren tekstfil som kan åpnes i alt som finnes og samtidig kan presenteres bra der markdown er støttet. Det er Win Win-situasjon


Hvorfr gjøre det slik. Noen ganger er det lettere å finne ut av noe om du ser det du leter etter, og andre ganger er en metode å teste det du finner.
På dette stedet https://github.com/kvapehe/cliogkoding/ skal det ikke finnes kode som gjlr nmoe eller stor skade uten at det informeres om det.

Fke.s del, format, rm og deltree kan gjøre en del skade så da er det nevt i teksten.

## Eksempel 01
https://github.com/kvapehe/cliogkoding/blob/main/lenker/speedinfo01.md

Denne "kompliserte" kommandoen oppsummerer mye av det en har lært om batch og bash-"progrramering" 
```bash

ping -q -w 1 -c 1 ip r | grep default | cut -d ' ' -f 3 > /dev/null && echo "OK Router er aktiv" || echo Feil router er nede" 

ping -q -w 1 -c 1 $(ip r | grep default | cut -d ' ' -f 3) > /dev/null && echo OK Router er aktiv || echo "Feil router er nede" ping -q -w 1 -c 1 $(ip r | grep default | cut -d ' ' -f 3) && echo OK Router er aktiv || echo "Feil router er nede"
```

Den kan skrives over flere linjer om en ønsker det. Da må en ta med \ på slutten av linjen, og noen koder er det gjort.

Det linjen gjør er å sjekke om "internett er OK" eller om noe rart skjer.  
Linjen er et lite eksperiment på hva som kan gjøres med bash i linux og det er lite som lar seg utfore i Windows.

Her ser en den solleklare styrken til linux, uix eller ix-systemer. MAge små programmer kan bygges ut i stor grad til å utføre enkle oppgaver alene og til sammen nesten lage et komplett program.

Noen kode systemer som er støttet:
https://markdown.land/markdown-code-block

```
Here’s the list of commonly supported languages on sites like GitHub:

    actionscript3
    apache
    applescript
    asp
    brainfuck
    c
    cfm    
    clojure
    cmake
    - cmd Added by me (cmd, bat, batch)
    coffee-script, coffeescript, coffee
    cpp – C++
    cs
    csharp
    css
    csv
    bash
    diff
    elixir
    erb – HTML + Embedded Ruby
    go
    haml
    http
    java
    javascript
    json
    jsx
    less
    lolcode
    make – Makefile
    markdown
    matlab
    nginx
    objectivec
    pascal
    PHP
    Perl
    python
    profile – python profiler output
    rust
    salt, saltstate – Salt
    shell, sh, zsh, bash – Shell scripting
    scss
    sql
    svg
    swift
    rb, jruby, ruby – Ruby
    smalltalk
    vim, viml – Vim Script
    volt
    vhdl
    vue
    xml – XML and also used for HTML with inline CSS and Javascript
    yaml
```    
