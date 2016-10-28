#!/usr/bin/env bash
start=$(date +"%s")

#variables
beginEndBigLine="echo =================================================="
bedinEndSmallLine="echo .................................................."
lineBreak="echo -------------------------------------------------"

$beginEndBigLine
$bedinEndSmallLine

red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
bright=`tput bold`
bold=`tput bold`
underline=`tput smul`
blink=`tput blink`
reset=`tput sgr0`

(set -x; cd $(brew --repo) &&  git fetch && git reset --hard origin/master;)
(set -x; brew update;)
(set -x; brew cask update;)

(set -x; brew upgrade;)

(set -x; brew cleanup;)
(set -x; brew cask cleanup;)


casks=( $(brew cask list) );
$lineBreak
for cask in ${casks[@]}
do
    installed="$(brew cask info $cask | grep 'Not installed')"

    if [[ $installed = *[!\ ]* ]]; then
    	echo "${red}${cask}${reset} requires ${red}update${reset}."
        (set -x; brew cask install $cask --force;)
    else 
    	echo "${red}${cask}${reset} is ${green}up-to-date${reset}."
    fi
done;
$lineBreak
(set -x; java -version;)
$lineBreak
echo updating npm
(set -x; npm -v;)
(set -x; npm install npm@latest -g;)
$lineBreak
echo updating pip
(set -x; pip install --upgrade pip setuptools;)
$lineBreak
echo symlinking pip python applications to /Applications.
(set -x; brew linkapps python;)
$lineBreak
end=$(date +"%s");
echo ${underline}${blue}${bright}Total brewup time: ${bold}$((end-start)) seconds.${reset}

$bedinEndSmallLine
$beginEndBigLine
