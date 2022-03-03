#!/bin/bash

printf "\nWelcome to Bash-Translator\n"

printf "\nType a word:\n"

function main(){
	read var_word
	
	word_HEX=$(printf $var_word| xxd -p -u -i| sed 's/ 0X/%/g; s/%0A//; s/,//g'| tr -d "[:space:]")

	regEx=

	tildaP=~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	resultP=Result\|Резултат

	egP=Examples\|Примери

	if [ $var_word = q ]; 
	then
		exit

	elif [[ $var_word = [A-z]* ]];
	then
		echo "ENG"

		printf "\n $resultP\n"
		
		# With sed command
		grep -m 3 'data-translation=' $HOME/.Bash-Translator-temp| grep -o -E '"[a-z]*"'| sed '/"phrase"/d; s/"//g'
		printf "\n $egP\n"
		
		grep -A 1 -m 3 '<p >' $HOME/.Bash-Translator-temp | sed 's|<p class="ml-4 " lang="en" >|EN - |; s|<p >|BG - |; s|<strong>||; s|</strong>||; s|</p>||; s|&#39;|`|g'

		printf $tildaP


	elif [[ $var_word != [A-z]* ]];
	then

		printf "\n $resultP\n"
		
		# With sed command
		grep -m 3 'data-translation=' $HOME/.Bash-Translator-temp| grep -o -E '"[a-z]*"'| sed '/"phrase"/d; s/"//g'
		
		# With tr command
		#grep -m 3 'data-translation=' $HOME/.Bash-Translator-temp| grep -o -E '"[a-z]*"'| sed '/"phrase"/d'| tr -d /\"/

		printf "\n $egP\n"
		
		grep -A 1 -m 3 '<p >' $HOME/.Bash-Translator-temp | sed 's|<p class="ml-4 " lang="en" >|EN - |; s|<p >|BG - |; s|<strong>||; s|</strong>||; s|</p>||; s|&#39;|`|g'

		printf $tildaP

	fi
	
	# Without File
	#curl -s https://bg.glosbe.com/bg/en/$word_HEX| grep '<p >'
	
	# With File
	curl -s https://bg.glosbe.com/bg/en/$word_HEX > $HOME/.Bash-Translator-temp

	printf "\n\nType a new word or type exit:\n"
	main
}

main


#if RegEx for bg or eng

#tput clear

