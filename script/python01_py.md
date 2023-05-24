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
- [Script (Win python) Python 1] *    
- [Script (Win python) Python 1 versjon b](./python01b.py) Alternativt vise som [md-fil Python 1 versjon b](./python01b_py.md)  
<!-- 
- [Script (Linux python) Python 2](./python02.py) NB ikke klar enda 
- [Script (OS uavhengig python) Python 3](./python03.py) NB ikke klar enda 
-->
## Python kode
```python
#!/bin/python

# The above line is called a shebang sh for shell and bang for somthing to happen.
# One reason to use it is if the script is runnable by itself it makes sense telling the OS what type of wile is running.
# this lets the us run the .py fiw without using python3 infront of the script.
# like this ./f3 instead of this python3 f3.py. however the chmod has to meb +x for this to work,
# and if yo like to remove the ./ you also need to ad the folder to the OS path.
# This is not part of this lesson, but knowing about it may help you investigate further.

# Before you dig into this heavily commented file.
# Now that you have seen several file types like .sh, .cmd, .py ... you may have seen some similarities.
# The fact is that there are many similarities to different languages, so what you learn one plavce may be used another place
# Well therea also details that are not the same, and this script demonstrates a few of them.
# These will producec errors and are commented, but do uncomment and try to investigate

# Some souces for this example: (This shows you the vaue of creating good searches instead of simply using
# a "dumb" AI. Debatable, but AI without userknowledge is not the best solution.
# By increasing your own knowledge and then using AI as one of many tools may help.
# For instance almost all the examples presented in this lecture / project could have been written by an AI if the instructions were clear enough.
# The prompter should aslo know a bit of the domain to verify the AI-answers as the first answers look very trustable, but are 
# complete noncense. The AI methond was tested with smome students, and they were told to fix the code.
# Almost all had toe read up about the domain to bee able to fix it, making my point AI is statistical dumbe collection of data.
# The user has to chose from all the data. The NLM and GPT AI simply help the user to find som source out of the vast exisiting sourcces.

# The AI will mix sources so it is difficult to find here it comes from, so in order to help yyou with this code, here are the sources used
# https://stackoverflow.com/questions/62044046/typeerror-can-only-concatenate-tuple-not-str-to-tuple-problem-with-widgets
# https://researchdatapod.com/how-to-solve-python-typeerror-can-only-concatenate-tuple-not-str-to-tuple/ (Nice page lots of great practical lesson links on the page)
# https://duckduckgo.com/?t=ffab&q=python+remainder&ia=web
# https://duckduckgo.com/?t=ffab&q=pythoin+degree+symbol&ia=web&iax=qa
# https://theprogrammingexpert.com/python-degree-symbol/
# https://www.w3schools.com/python/module_math.asp
# https://www.w3schools.com/python/ref_math_degrees.asp#gsc.tab=0&gsc.q=degree%20symbol
# https://www.w3schools.com/charsets/ref_html_utf8.asp
# https://www.w3schools.com/charsets/ref_utf_letterlike.asp
# https://www.w3schools.com/charsets/tryit.asp?deci=8451
# https://www.w3schools.com/python/trypython.asp?filename=demo_ref_math_remainder2
# https://duckduckgo.com/?t=ffab&q=python+return+multiple+values+from+function&ia=web&iax=qa
# https://stackoverflow.com/questions/26996903/python-return-multiple-variables-from-a-function
# https://realpython.com/python-return-statement/
# The above sources helped creating this example, although there are many alternatives that could have been chosen to avoid the
# resarch since a basic understanding of python was accuired before the script was written.


# Import "neccesary libraries"
# OS is need to let pythonreqquest data from the operating system
# the math module is optional and only used to demonstrate some nice to know functions / methods
import os
import math 


# This script prints a few uncecceasy messages. To show them set the value to one, otherwise as 0 prevents the debug information
# There are libraries to handle this. For now a simple if test removes debug information
debug = 1 # Set debug active
debug = 0 # Disable debug to reset and let the program work normally Add a # infront of this and enter the Debug mode

# The method 
# def main():
# main()
# or even the improved __main__ was not used in this example, but feel free to investigate that on your own.
# It is a more advanced mthod running python scripts, and you will often encounter it in more advanced scripts.
# try making a syntax error with the math-library and then open the referrenced path
# Here is one example file cat /usr/lib/python3/dist-packages/matplotlib/__init__.py
# Do not open the file in an editor as the root user. If the file is edited the matplotlib may not work cat or open as ordinary user is OK


# A little bit about linux and unix. Use Wikipedia for much more information.
# The ix pilosopy is everythin on the system is a file. Even directories/folders are files.
# This approach let you question the processor (CPU) wwhich type it is and the system answers. Here is une command
# Try it in the os if you like cat /proc/cpuinfo
# Now the same approach is used tfor the temperature sensor inside the computer.

# Linux internal temperature in any computer. Note does not work in Windos as
# /sys/ does not exist. It does however work in all ux and ix environments like ios, android, OSX (as this is a unix flavour
# and all kind of linux flavours. It has been tested on arch, ubuntu, raspberry pi and a macbook
# Similar commands are available to Windows. It is possible to ask the wmic with powershell and regular cmd.
# By crafting a special python script it is possible to let it run on different OS's as the import os is universal
zone_temp_raw  = tuple(os.popen("cat /sys/class/thermal/thermal_zone*/temp").read())
zone_temp_raw2 =      (os.popen("cat /sys/class/thermal/thermal_zone*/temp").read())

# Note this only works in rasberry OS as vcgencmd is a shortcut to /sys/... and it has done the math
# rendering the below code somwhat redundant. Therefor it is commented as the script may be tried on any unix or linux computers
## zone_temp_raw1 = tuple(os.popen("vcgencmd measure_temp").read())


# Examine the zone temp raw details, when the debug flag is active
def investigateRawDetails():

  if (  debug == 1 ):
  
    print("\n=== Debug Raw temperatures")
    print("Raw Zone Temp in milli-Celcius:\t" + str(zone_temp_raw))
    # print("Raw Zone Temp in milli-Celcius:\n" + str(zone_temp_raw1)) # Commented since it only works if vcgencmd is avaialble
    print("Raw Zone Temp in milli-Celcius:\t" + (zone_temp_raw2) )



# Change from milli-degrees to degrees since the thermal 
# sensor is reported like that se the function investigateRawDetails()
# Raw value example 53692
def milliDegreeCelciusToDdegreeCelcius(zone_temp_raw2):  
  
  if (  debug == 1 ):
    print("\n=== Debug milli to whole value from temperatures:", end=" ")
    print(str(zone_temp_raw2))  # the str is otional as the variable is already a str Note the str contains a \n
    print(type(zone_temp_raw2)) # type class is str    
  
  zone_temp_raw2 = float(zone_temp_raw2)*1e-3 # 53692 / 1000 = 53.692
  
  if (  debug == 1 ):
  
    print("\n===== Debug milli temperature is printed with lots of decimals:", end=" ")
    print((zone_temp_raw2))
    print(type(zone_temp_raw2))
    print((zone_temp_raw2)) # Redundant, but removing this changes how the 2 lines above are printed so it is left alone.
    
    print("\n===== Debug milli temperature is printed:", end=" ")    
    print(type(zone_temp_raw2)) # type class is float    
    
    print("\n===== Debug milli temperature is printed or is it?:", end=" ")    
    # failed in python, so not all knowledge from c++ may be used in python. (Note a logical fail, not syntax fail)
    print((zone_temp_raw2//1e3)) 
    
    
    # float of the decimal part. Note the decimal error on the 15th to 16 decimal place
    # Such error have to be handled if you for instance would like to compare two nnmbers. So consider
    # type class handling when uing oown numbers and variables The 1e-notation is the technical way to write scientific numbers.
    # 100 is 10 * 10, 10^2, and 1e2 the 1e2 means 1 * 10^2 and all nuimbers may be written like that. instead of dividing a number with 
    # 10.0 to convert a number form integer to float you may simply multiply with 1e0 or 1.0e0 or for the /100 1e-2.
    # This method prevent any divide by zero mistakes possible. It is much better to multiply with 1/something than dividing.
    # The 1/somthing is written 1^-n where n is any number. and the scientific notation is 1.yyyye-n
    # Anyway that was a digresion with some possilby forgotthen math knowledge. The math liblary helps with any conversion, so make
    # sure you use it as othes as possible. here is one you may use often math.pi or this if you are into electronics print(math.tau*1e1 ) 63%
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

  # Finally before presentation, lets handle the unit for the temperature.
  # Degree symbols: With unicode there are defined symbols, but you may mix the degree and a C to produce
  # something simlar to the degC. Below are three methods to create the symbols neccesary.
  # The preferred method for readability is the degreesymbol1 version, although degreesymbol2 is the same
  # Here is a reference to the unicode table, note the number is in HEX
  # https://www.w3schools.com/charsets/ref_utf_letterlike.asp and https://www.w3schools.com/tags/ref_utf_latin1_supplement.asp
  # Look at the entire set here: https://www.w3schools.com/charsets/default.asp and here https://www.w3schools.com/charsets/ref_html_utf8.asp
  # By the way unicode, utf, is a whole new story so do study the above linked pages if you are interested writing "correct" symbols.
  degreesymbol0 = u'\N{DEGREE SIGN}C'
  degreesymbol1 = u'\N{DEGREE CELSIUS}'
  degreesymbol2 = '\u2103'

  if (  debug == 1 ):
    print("\n===== Debug degree symbols", end=" ")
    print(f"{degreesymbol0}C {degreesymbol2}C", end=" and ")
    print(f"{degreesymbol0}C 1 __{degreesymbol1}__ 2 __{degreesymbol2}__" )
  return degreesymbol1, degreesymbol0
  


# Note all of the above may be handled by functions in pyhon like {}.2% when printing
# The only reason all the details is done is to let the user tinker with the numbers on their own, and
# to show how numbers whichh are strings when the ayre receveid from the operationg system may be prepared for differnet types of math.
# For instance it is now easy to convert from Celcius to other temerature scales. 




# Now with all the technical stuff handled, lets present the temperature to the user.
def printValuesToUser(zone_temp_raw2, wholetemperature, remainderpartasint):

  fail = -1 # The -1 indicates somthing went wrong
  if (  debug == 1 ):
    print("\n=== Debug print the intermediary values:", end="\n")
    print((  math.floor(zone_temp_raw2)  ))
    print(remainderpartasint)

  # All values are numbers of type int64 and may be easilly changed. The presentation looks like an entire string sentence
  # There is no need to handle decimals as the math earlier has done that.
  print("\n======================================\n" \
    f" The system temperature is: {wholetemperature},{remainderpartasint} {degreesymbol1}." \
    
    f"\n The system temperature is: {wholetemperature},{remainderpartasint} {degreesymbol0}." \
    
    "\n\n (\n  Alternatively use the variable\n  degreesymbol0 if the unicode\n  degree symbol is hard to read.\n )" \
    "\n======================================\n") 
  # Note skipped this method  # equalsign = "="*50 # print(equalsign)
    
  # The command vcgencmd measure_temp does the ame as this entire script when it is ran on Raspberry pi
  # except it used the . decimal character. The idea with the script is to "teach / show some general commands
  # with something that may be useful to the user. modifying this script to produce graphs, multipple tests, even
  # creating an alarm if a value rises too much or anything the user finds interesting is possible whith little programming.
  
  # Returns 0 to show it executed correctly
  # The return code may be used by a calling program, either within pyton or simply in the shell / cli
  # The cli part was the whole idea with this project in the first place.
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
# Visit the the function to see the details Returns two divverent symbols
degreesymbol1,degreesymbol0 = degreeSymbol()


# Finally presenting to the user the number with correct symbol.
# As all functions return a value the value may be used to other things than just presenting it
# print was selected to give an idea what python may use a value (actually a str) from the os
# And temperature value was simply chose as one of many 
printValuesToUser(zone_temp_raw2, wholetemperature, remainderpartasint)

# ====================================== ======================================




# This little routine lets the user play around with each single character, 
# including any \n, \t characters if they are present.
def tupleExample():
  print("\nTuple example how to create the number digit by digit:\t" )
  zone_temp = ()

  x = ""
  print("", end="  ")
  print(zone_temp_raw)
  
  print("\n  x:", end=" ")
  for i in zone_temp_raw:
      if i == "\n":          
          print("\n\n  zone_temp type is ", end=" ")
          print(type(zone_temp))
          
          print("  x type is ", end=" ")
          print(type(x))
          zone_temp = (zone_temp + (x,) )
          # print(type(x))
          x = ""
      else:
          x = str(x) + str(i)
          print(f"{x}",end="\t")
          
  
  print("\n  zone_temp content is ", end=" ")
  print((zone_temp) )
  
  print("  Zt: " + str(zone_temp) )
  print("End tuple example\n")


if (  debug == 1 ):
  tupleExample()


# ====================================== ======================================

# and finally using ''' and """ could simplyfy all the comments, llike so.
# This is a muliti line
# comment, but actually that does not exist in python like the /** */, and /** */ in c++
# The ''' is something called a python docstring. Feel free to search for that on the internet
# Here is an example of a python docstring
multilineDocString = """
# This is a muliti line \"comment\"
 The two ''' and \""" could simplyfy all the comments, as there is no need to enter all the #
in front of the lines. Also a part of this are spaces, both horissontal spaces and vertical spaces like 
any \\n, \\r\\n, ENTERS etc.# This is a muliti line. A single \ncreates a new line or is like pressing the ENTER-key.
Inside the docstring there is no need to enter the \\n to create a new line. simply pressing ENTER 3 times creates



Three vertical spaces or newlines
The multiline # comment does not exist in python like the /** */, and /** */ in c++
Byt the way a /** indicates a docstring of type javadoc, and is later implemneted nin c++.
Prior to java the /** was no different than the /* so a good advice try to learn abit about docstrings, 
they may help you alot later, for instance when you are automatically documenting the code.
END docstring text.
"""

if (  debug == 1 ):
  print(multilineDocString)
  

```
## Python utskrift til skjerm eksempel
```python
echo Utskrift til skjerm

======================================
 The system temperature is: 55,84 ℃.
 The system temperature is: 55,84 °C.

 (
  Alternatively use the variable
  degreesymbol0 if the unicode
  degree symbol is hard to read.
 )
======================================


```

### Eksempel avsluttet