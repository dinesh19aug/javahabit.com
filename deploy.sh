#!/bin/bash

echo -e "Deploying updates to GitHub"
rm -rf public
# Build the project.
hugo -t zzo #-t dream # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cp -fR public/* ../dinesh19aug.github.io/
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ../dinesh19aug.github.io/
git add .
# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
git push origin master
