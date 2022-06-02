#!/bin/bash

Color_Off='\033[0m'       # Text Reset

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White


# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

echo -e "${BYellow}[+] Project Name: " $PROJECT_NAME

if test -d "$PWD/${PROJECT_NAME}" ; then
	echo "$PROJECT_NAME exists."
fi

echo -e "${BBlue}[+] Updating Packages..."
apt-get update -y > /dev/null
echo -e "${BBlue}[+] Packages updated.\n"

echo -e "${BBlue}[+] Installing moreutils..."
apt-get install moreutils -y > /dev/null
echo -e "${BBlue}[+] moreutils installed successfully.\n"

printf "${BGreen}[+] Valid UTF-8 Files${Color_Off}\n"
isutf8 -i $(find $PROJECT_NAME -type f)
printf "\n"

printf "${BRed}[+] Invalid Files${Color_Off}\n"
isutf8 -l $(find $PROJECT -type f)
printf "\n"

# find . -type f -name "*.txt" ! -path "./NucleoDuro/NucleoDuro/NucleoDuro/Models/*"

function generate_exclude_ext_regex() {
	extensions="${EXCLUDE_EXT// /\\|}"
	exclude_ext_regex=".*\.\($extensions\)"	
	find $PROJECT_NAME -type f -regex $exclude_ext_regex
}

function generate_exlude_path() {
	find . -type f  ! -path "./NucleoDuro/NucleoDuro/NucleoDuro/Models/"
}

# : '
# '