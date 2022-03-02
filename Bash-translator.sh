#!/bin/bash

printf "\nWelcome to Bash-Translator\n"

printf "\nSearch for a word:\n"

read var_word

word_HEX=$(printf $var_word| xxd -p -u -i| sed 's/ 0X/%/g; s/%0A//; s/,//g'| tr -d "[:space:]")

# Without File
#curl -s https://bg.glosbe.com/bg/en/$word_HEX| grep '<p >'

# With File
curl -s https://bg.glosbe.com/bg/en/$word_HEX > $HOME/.Bash-Translator-temp

printf "\nResulte\n"
grep 'data-translation=' $HOME/.fast_Words_Temp

printf "\nExamples\n"
#printf "|--------------------|"

grep '<p >' $HOME/.Bash-Translator-temp

#if RegEx for bg or eng


printf "\n\nSearch for new word:\n\n"
#echo $HEX


