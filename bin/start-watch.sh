#!/bin/sh -eu

./bin/wait.sh
npx lerna run start:watch --scope @anontown/server --stream
