#!/bin/bash

printf "\nWelcome to Bash-Translator\n"

printf "\nSearch for a word:\n"

read var_word

word_HEX=$(printf $var_word| xxd -p -u -i| sed 's/ 0X/%/g; s/%0A//; s/,//g'| tr -d "[:space:]")

# Without File
#curl -s https://bg.glosbe.com/bg/en/$word_HEX| grep '<p >'

# With File
curl -s https://bg.glosbe.com/bg/en/$word_HEX > $HOME/.Bash-Translator-temp

printf "\nResulte\n\n"

# With sed command
grep -m 3 'data-translation=' $HOME/.fast_Words_Temp| grep -o -E '"[a-z]*"'| sed '/"phrase"/d; s/"//g'

# With tr command
#grep -m 3 'data-translation=' $HOME/.fast_Words_Temp| grep -o -E '"[a-z]*"'| sed '/"phrase"/d'| tr -d /\"/

printf "\nExamples\n"
#printf "|--------------------|"

grep -A 1 -m 3 '<p >' $HOME/.Bash-Translator-temp | sed 's|<p class="ml-4 " lang="en" >|EN - |; s|<p >|BG - |; s|<strong>||; s|</strong>||; s|</p>||; s|&#39;|`|'

#if RegEx for bg or eng

printf "\n\nSearch for new word:\n\n"

