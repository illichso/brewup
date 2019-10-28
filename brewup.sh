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

echo "updating from  https://github.com/Homebrew/brew.git"
(set -x; cd "$(brew --repo)" && git fetch && git reset --hard origin/master;)

#(set -x; git -C "$(brew --repo homebrew/core)" fetch --unshallow;)
#(set -x; cd $(brew --repo) && git fetch && git reset --hard origin/master && git pull origin master && cd -;)

#(set -x; cd /usr/local/Homebrew/Library/Taps/buo/homebrew-cask-upgrade && git pull origin pull/114/head;)

(set -x; brew update;)

(set -x; brew upgrade;)

(set -x; brew cu -ay;)
(set -x; npm install -g appium;)

#$lineBreak
#casks=( $(brew cask list) );
#for cask in ${casks[@]}
#do
#    version=$(brew cask info $cask | sed -n "s/$cask:\ \(.*\)/\1/p")
#    installed=$(find "/usr/local/Caskroom/$cask" -type d -mindepth 1 -maxdepth 1 -name "$version")
#
#    if [[ -z $installed ]]; then
#        echo "${red}${cask}${reset} requires ${red}update${reset}."
#        (set -x; brew cask uninstall $cask --force;)
#        (set -x; brew cask install $cask --force;)
#    else
#        echo "${red}${cask}${reset} is ${green}up-to-date${reset}."
#    fi
#done;
#$lineBreak

(set -x; brew cleanup;)
#(set -x; brew doct or;)
#(set -x; brew prune;)

#echo "updating npm version"
#(set -x; node -v;)
#(set -x; npm -v;)
#echo "clearing npm cache"
#(set -x; npm cache clean;)
#echo "installing globally useful packages"
#(set -x; npm i -sg npm@latest &>/dev/null;)
#echo "clearing npm cache"
#(set -x; npm cache clean;)
#(set -x; npm -v;)
#$lineBreak
#echo "updating pip"
#(set -x; pip install --upgrade pip;)
#(set -x; pip install --upgrade pip setuptools;)
$lineBreak
#echo "symlinking pip python applications to /Applications."
#(set -x; brew linkapps python;)
$lineBreak
end=$(date +"%s");
echo "${underline}${blue}${bright}Total brewup time: ${bold}$((end-start)) seconds.${reset}"

$bedinEndSmallLine
$beginEndBigLine
