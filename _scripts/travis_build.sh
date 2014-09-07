#!/bin/bash
set -e

JEKYLL_ENV=production
bundle exec jekyll build
bundle exec htmlproof ./_site --href_ignore '#'

mkdir tmp
cp -r _site/. tmp
cd tmp

git init
git config --global user.email "travis@travis-ci.org"
git config --global user.name "travis-ci"
git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials

git add -f .
git remote add origin https://github.com/danielnolan/danielnolan.github.com.git
git commit -m "Updated site after successful travis build $TRAVIS_BUILD_NUMBER auto-pushed to gh-pages"
git push -fq origin master > /dev/null
