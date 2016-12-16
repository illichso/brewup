#!/usr/bin/env sh

bedinEndSmallLine="echo .................................................."

echo "Install node";
(set -x; cd "$(brew --repo)" && git fetch && git reset --hard origin/master;)
(set -x; brew update;)
(set -x; brew upgrade;)
(set -x; brew cleanup;)
(set -x; brew install node;)
(set -x; brew cleanup;)

echo "Show installed node version";
(set -x; node -v;)

echo "Show npm default version";
(set -x; npm -v;)
(set -x; npm config set loglevel silent;)
#(set -x; npm config ls;)

echo "Update npm to latest version";
(set -x; npm i -gs npm@latest &>/dev/null;)
(set -x; npm cache clean;)

echo "Show latest installed npm version";
(set -x; npm -v;)

echo "Install global npm useful packages";
(set -x; npm i -gs npm-check-updates sort-package-json nsp &>/dev/null;)
(set -x; npm cache clean;)

echo "Show Install global npm useful packages";
(set -x; npm list -g --depth=0;)

echo "Show npm config:";
$bedinEndSmallLine
(set -x; npm config ls;)
$bedinEndSmallLine
