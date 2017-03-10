#!/usr/bin/env sh

bedinEndSmallLine="echo .................................................."


(set -x; cd "$(brew --repo)" && git fetch && git reset --hard origin/master;)
(set -x; brew update;)
(set -x; brew upgrade;)
(set -x; brew cleanup;)
(set -x; brew install node;)
(set -x; brew install yarn;)
(set -x; brew cleanup;)

(set -x; node -v;)

(set -x; npm -v;)

(set -x; yarn -v;)

#(set -x; npm config ls;)

(set -x; npm i -gs npm@latest &>/dev/null;)
(set -x; npm cache clean;)
(set -x; npm config set loglevel silent;)
(set -x; npm cache clean;)

(set -x; npm -v;)

(set -x; npm i -gs npm-check-updates sort-package-json nsp &>/dev/null;)
(set -x; npm cache clean;)

(set -x; npm list -g --depth=0;)


$bedinEndSmallLine
(set -x; npm config ls;)
$bedinEndSmallLine
