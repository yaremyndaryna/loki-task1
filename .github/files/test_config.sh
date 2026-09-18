#!/bin/bash

studentFile=$1
theme='default_theme'
themeValue='light'

header='myHeader'
user='User'
host='Host'
is='is:'

#Should be two correct answer
correctAnswer=0

#If student file is then copy data to our file
if [ -f $studentFile ];
then 

    while read line; do
#First check
        if [[ $line == *$theme* ]]; 
        then
            if [[ $line == $theme* ]];
            then
                if [[ $line =~ ($theme[ \t]*=[ \t]*$themeValue[ \t]*)$ ]];
                then
                   ((correctAnswer=correctAnswer+1))
                fi
            else
            	echo "Line do not start from word: $theme"
            fi
#Second check
        elif [[ $line == *$header* ]];
        then
            if [[ $line == $header* ]];
            then
                if [[ $line =~ ($header[ \t]*=[ \t]*$user[ \t]*$is[ \t]*\$\{USER\}\.[ \t]*$host[ \t]*$is[ \t]*\$\{HOSTNAME\}\.[ \t]*)$ ]];
                then
                   ((correctAnswer=correctAnswer+1))
                fi
            else
            	echo "Line do not start from word: $theme"
            fi
        else
            continue
        fi
    done < $studentFile
    
if [ $correctAnswer != 2 ];
then
    echo "You have $correctAnswer correct answer."
    exit 1
fi
#echo $correctAnswer
else
    echo "You did not push file $studentFile"
    exit 1
fi
