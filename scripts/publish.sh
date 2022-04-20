#!/usr/bin/env bash

set -e

DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "$DIR"

# make temporary directory
TMPDIR=$(mktemp -d)

echo $TMPDIR

cd $TMPDIR
git init
git remote add origin https://github.com/jinnieseo/jinnieseo.github.io.git
git fetch -a

cat $DIR/.git/config >.git/config
echo 'ref: refs/heads/gh-pages' >.git/HEAD

cp -r $DIR/public/* .

git add --all
git commit -m "Publish gh-pages"
git push origin gh-pages

[[ -d $TMPDIR ]] && rm -rf $TMPDIR
