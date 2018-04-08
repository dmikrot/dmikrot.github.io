#!/bin/bash

set -e

# Clean slate
git checkout -- .
git clean -df
git checkout source
rm -rf public

# Build deployables
brunch build --production

# Switch to production branch
git checkout master

# Clean slate
rm -rf img
rm -rf javascripts
rm -rf static
rm -rf stylesheets
rm -rf favicon.ico
rm -rf index.html

# Copy deployables
mv public/* ./
rmdir public

echo "Commit changes to publish"
