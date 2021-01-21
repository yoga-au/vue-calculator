#!/usr/bin/env sh

# abort on errors

set -e

# build
npm run build

# navigate to dist folder
cd dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m "Deploy"

git push -f git@github.com:yoga-au/vue-calculator.git main:gh-pages

cd -

chmod +x deploy.sh
