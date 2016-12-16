#!/usr/bin/env sh

start=$(date +"%s")

#variables
beginEndBigLine="echo =================================================="
lineBreak="echo -------------------------------------------------"
red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
bright=`tput bold`
bold=`tput bold`
underline=`tput smul`
blink=`tput blink`
reset=`tput sgr0`


$beginEndBigLine
chmod +x ./uninstall_node.sh ./install_node.sh;

echo "Uninstall old node";

$lineBreak
./uninstall_node.sh;
$lineBreak

echo "Install new node";

$lineBreak
./install_node.sh;
$lineBreak

end=$(date +"%s");
echo "${underline}${blue}${bright}Total node reinstall time: ${bold}$((end-start)) seconds.${reset}"
$beginEndBigLine