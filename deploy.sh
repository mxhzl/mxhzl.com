#!/usr/bin/env bash

# I've run into situations before where I try to deploy before pulling main from remote
# so I would like to do something more robust than just pulling before deploying but
# for now this will suffice
echo
echo "### pulling most recent changes ###"
echo

git pull origin main 

echo
echo "### checking dependencies ###"
echo

# Make sure that dependencies are installed
if ! type mise >/dev/null; then
  echo "install is not installed, please install."
  echo "exiting..."
  exit 1
fi

mise install

echo "### all good, starting deploy ###"
echo

# Install yarn packages (just prettier)
echo "### running yarn install ###"
echo

yarn install
echo

# Build the site then move into public directory
echo "### running zola build ###"
echo

zola build
echo

cd public/ || exit 1

echo "### running yarn exec -- prettier . --write ###"
echo

# Format html files
yarn exec -- prettier . --write
echo

# Do a dry run to make sure everything looks right
echo "### running neocities push --prune --dry-run . ###"
echo

neocities push --prune --dry-run .

# Ask user for confirmation on above plan the do deploy
echo
read -p "does that look good? (Y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "### running neocities push --prune . ###"
  neocities push --prune .
  echo "site deployed"
  echo "https://mxhzl.com"
  echo
fi

echo "exiting..."
exit 0

