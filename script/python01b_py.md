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
- [Script (Dos/Win/cmd) Batch 3](./batch03.cmd) Alternativt vise som [md-fil Batch 3](./batch03_cmd.md)   
- [Script (Win python) Python 1](./python01.py) Alternativt vise som [md-fil Python 1](./python01_py.md)  
- [Script (Win python) Python 1 versjon b] *   
<!-- 
- [Script (Linux python) Python 2](./python02.py) NB ikke klar enda 
- [Script (OS uavhengig python) Python 3](./python03.py) NB ikke klar enda 
-->
```python
#!/bin/python

# The idea with the b version of the python01.py is to show a less commented version
# Nota all the links are also removed so do check the python01.py instead of this python01b.py file.

# Import libraries
import os
import math 


debug = 0 # Debug is inactive

# A python script calls OS to get the temperature data in any linux or unix environment
zone_temp_raw  = tuple(os.popen("cat /sys/class/thermal/thermal_zone*/temp").read())
zone_temp_raw2 =      (os.popen("cat /sys/class/thermal/thermal_zone*/temp").read())

# Examine the zone temp raw details, when the debug flag is active
def investigateRawDetails():

  if (  debug == 1 ):
  
    print("\n=== Debug Raw temperatures")
    print("Raw Zone Temp in milli-Celcius:\t" + str(zone_temp_raw))
    # print("Raw Zone Temp in milli-Celcius:\n" + str(zone_temp_raw1)) # Commented since it only works if vcgencmd is avaialble
    print("Raw Zone Temp in milli-Celcius:\t" + (zone_temp_raw2) )



# Change from milli-degrees to degrees since the thermal 
def milliDegreeCelciusToDdegreeCelcius(zone_temp_raw2):  
  
  if (  debug == 1 ):
    print("\n=== Debug milli to whole value from temperatures:", end=" ")
    print(str(zone_temp_raw2))  # the str is otional as the variable is already a str Note the str contains a \n
    print(type(zone_temp_raw2)) # type class is str    
  
  zone_temp_raw2 = float(zone_temp_raw2)*1e-3 # 53692 / 1000 = 53.692
  
  if (  debug == 1 ):
  
    # Now prints the
    
    print("\n===== Debug milli temperature is printed with lots of decimals:", end=" ")
    print((zone_temp_raw2))
    print(type(zone_temp_raw2))
    print((zone_temp_raw2)) # Redundant, but removing this changes how the 2 lines above are printed so it is left alone.
    
    print("\n===== Debug milli temperature is printed:", end=" ")    
    print(type(zone_temp_raw2)) # type class is float    
    
    print("\n===== Debug milli temperature is printed or is it?:", end=" ")    
    # "Failes" in python, so not all knowledge from c++ may be used in python. (Note a logical fail, not syntax fail)
    print((zone_temp_raw2//1e3)) 
    
    print("\n===== Debug remainder temperature is printed with lots of decimals:", end=" ")    
    print((zone_temp_raw2 % 1e0)) 
    
  return zone_temp_raw2


# Splitting the integer part and the remainder like so // and % in c++
# Also converting to the , decimal point for presentation 5.45 -> 5,54
def degreenumber(zone_temp_raw2):
  wholetemperature = math.floor(zone_temp_raw2)
  remainderpart    =            zone_temp_raw2 % 1e0

  commaseparatorinNorway = ","
  commaseparatorinUk = "."
  numberofdecimals = 2

  remainderparttoint = remainderpart * 1e3
  remainderpartasint = math.floor(remainderparttoint/1e1)
  
  return (wholetemperature, remainderpartasint)


def degreeSymbol():
 
  # Creating the degree symbol
  degreesymbol0 = u'\N{DEGREE SIGN}C'
  degreesymbol1 = u'\N{DEGREE CELSIUS}'
  degreesymbol2 = '\u2103'

  if (  debug == 1 ):
    print("\n===== Debug degree symbols", end=" ")
    print(f"{degreesymbol0}C {degreesymbol2}C", end=" and ")
    print(f"{degreesymbol0}C 1 __{degreesymbol1}__ 2 __{degreesymbol2}__" )
  return degreesymbol1, degreesymbol0


# Present the temperature data to the user
def printValuesToUser(zone_temp_raw2, wholetemperature, remainderpartasint):

  fail = -1 # The -1 indicates somthing went wrong
  if (  debug == 1 ):
    print("\n=== Debug print the intermediary values:", end="\n")
    print((  math.floor(zone_temp_raw2)  ))
    print(remainderpartasint)

  # The values are int64 numbers even the end number will look like a float number. All floating errors are removed
  print("\n======================================\n" \
    f" The system temperature is: {wholetemperature},{remainderpartasint} {degreesymbol1}." \    
    f"\n The system temperature is: {wholetemperature},{remainderpartasint} {degreesymbol0}." \    
    "\n\n (\n  Alternatively use the variable\n  degreesymbol0 if the unicode\n  degree symbol is hard to read.\n )" \
    "\n======================================\n") 

  # Returns 0 to show it executed correctly
  fail = 0
  return fail



# ====================================== ======================================
# Calling all the previously made functions

# Examine the raw details. (Note this only works when the debug flacg is active)
investigateRawDetails()

# Get modified temperature value
zone_temp_raw2 = milliDegreeCelciusToDdegreeCelcius(zone_temp_raw2)

# Create a decimal number with a ,
wholetemperature, remainderpartasint = degreenumber(zone_temp_raw2)

# Now creating the unit for degree. This is a unicode degreesymbol.
degreesymbol1,degreesymbol0 = degreeSymbol()


# Finally presenting to the user the number with correct symbol.
printValuesToUser(zone_temp_raw2, wholetemperature, remainderpartasint)

# ====================================== ======================================


# Removed the rest from the original python01.py file


# ====================================== ======================================

```