#!/bin/bash

cp -r ../../sandigo-sdk .
yarn add ./sandigo-sdk
yarn install
yarn build
gcloud app deploy
rm -rf sandigo-sdk