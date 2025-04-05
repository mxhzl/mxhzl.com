#!/usr/bin/env bash

echo
echo "### checking dependencies ###"
echo 

# Make sure that dependencies are installed
if ! type neocities > /dev/null; then
  echo "neocities cli is not installed, please install."
  echo "exiting..."
  exit 1
fi

if ! type zola > /dev/null; then
  echo "zola is not installed, please install."
  echo "exiting..."
  exit 1
fi

if ! type yarn > /dev/null; then
  echo "yarn is not installed, please install."
  echo "exiting..."
  exit 1
fi

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

cd public/

echo "### running yarn exec -- prettier . --write ###"
echo

# Format html files
yarn exec -- prettier . --write
echo

# Do a dry run to make sure everything looks right
echo "### running neocities push --dry-run . ###"
echo

neocities push --dry-run .

# Ask user for confirmation on above plan the do deploy
echo
read -p "does that look good? (Y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "### running neocities push . ###"
    neocities push .
    echo "site deployed"
    echo "https://mxhzl.com"
    echo
fi

echo "exiting..."
exit 0