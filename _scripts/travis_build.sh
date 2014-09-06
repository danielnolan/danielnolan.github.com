#!/bin/bash

bundle exec jekyll build

git config --global user.email "travis@travis-ci.org"
git config --global user.name "travis-ci"
git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials

mkdir tmp
cp _site/. tmp
cd tmp
git init
git add -f .
git add tags -f
git remote add origin "https://${GH_TOKEN}:@github.com"
git commit -m "Updated site after successful travis build $TRAVIS_BUILD_NUMBER auto-pushed to gh-pages"
git push -fq origin master > /dev/null
