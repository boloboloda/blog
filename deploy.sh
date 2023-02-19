#!/bin/sh

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

echo "Deleting old publication"
rm -rf public

echo "Generating site"
hugo

echo "Updating master branch"
cd public && git add --all && git commit -m "Publishing to master (deploy.sh)"

echo "Push to origin"
git push origin gh-pages