#!/bin/sh

version=$(cat VERSION)
themes=$(cat THEMES)
IFS=$'\n'

for theme in $themes; do
    echo "Building theme: $theme"
    cd $theme
    npm install pnpm -g
    DISABLE_ESLINT_PLUGIN='true' REACT_APP_VERSION=$version pnpm run build
    cd ..
done
