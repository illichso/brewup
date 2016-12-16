#!/usr/bin/env sh

bedinEndSmallLine="echo .................................................."

echo "Install node";
cd "$(brew --repo)" && git fetch && git reset --hard origin/master;
brew update;
brew upgrade;
brew cleanup;
brew install node;
brew cleanup;

echo "Show installed node version";
(set -x; node -v;)

echo "Show npm default version";
(set -x; npm -v;)

#(set -x; npm config ls;)

echo "Update npm to latest version";
(set -x; npm i -gs npm@latest &>/dev/null;)
npm cache clean;
(set -x; npm config set loglevel silent;)
npm cache clean;


echo "Show latest installed npm version";
(set -x; npm -v;)

echo "Install global npm useful packages";
(set -x; npm i -gs npm-check-updates sort-package-json nsp &>/dev/null;)
npm cache clean;

echo "Show Install global npm useful packages";
npm list -g --depth=0;

echo "Show npm config:";
$bedinEndSmallLine
(set -x; npm config ls;)
$bedinEndSmallLine
