#!/usr/bin/env sh

echo "Finding node before uninstalling by brew";
node -v;
npm -v;
yarn -v;

echo "Running brew uninstall --force node"
brew uninstall --force nvm;
brew uninstall --force n;
brew uninstall --force nodebrew;
brew uninstall --force node-build;
brew uninstall --force nodenv;
brew uninstall --force nodeenv;
brew uninstall --force nave;
brew uninstall --force llnode;
brew uninstall --force node;
brew uninstall --force yarn;
echo "brew prune"
brew prune;
echo "brew doctor"
brew doctor &>/dev/null;
echo "brew prune"
brew prune;

echo "Finding node before manually deleting";
node -v;
npm -v;

echo "Removing previously installed nodejs"
rm -rf /usr/local/lib/node*;
rm -rf /usr/local/include/node*;
rm -rf ~/local/node*;
rm -rf ~/lib/node*;
rm -rf ~/include/node*;
rm -rf /usr/local/bin/node*;
rm -rf /usr/local/bin/npm*;
rm -rf /usr/local/lib/dtrace/node.d;
rm -rf /usr/local/share/man/man1/node*;
rm -rf /usr/local/share/man/man1/npm*;
rm -rf /usr/local/share/man/man2/node*;
rm -rf /usr/local/share/man/man2/npm*;
rm -rf /usr/local/share/man/man3/node*;
rm -rf /usr/local/share/man/man3/npm*;
rm -rf /usr/local/share/man/man4/node*;
rm -rf /usr/local/share/man/man4/npm*;
rm -rf /usr/local/share/man/man5/node*;
rm -rf /usr/local/share/man/man5/npm*;
rm -rf /usr/local/share/man/man6/node*;
rm -rf /usr/local/share/man/man6/npm*;
rm -rf /usr/local/share/man/man7/node*;
rm -rf /usr/local/share/man/man7/npm*;
rm -rf /usr/local/share/man/man8/node*;
rm -rf /usr/local/share/man/man8/npm*;
rm -rf /usr/local/share/man/man9/node*;
rm -rf /usr/local/share/man/man9/npm*;
rm -rf /usr/local/lib/dtrace/node.d;
rm -rf ~/.npm;
rm -rf ~/.yarnrc;
rm -rf ~/.babel.json;
rm -rf ~/.node*;
rm -rf /opt/local/bin/node;
rm -rf /opt/local/include/node;
rm -rf /opt/local/lib/node*;
rm -rf /usr/bin/npm;
rm -rf /usr/local/share/systemtap/tapset/node.stp;
rm -rf /var/db/receipts/org.nodejs.*;
rm -rf ~/.nvm;
rm -rf /usr/local/Cellar/node;

echo "Finding node after manually deleting";
echo "Trying node -v";
node -v;
echo "Trying npm -v";
npm -v;
echo "Trying yarn -v";
yarn -v;
