#!/bin/bash

set -e

echo Running in $(pwd) ...
echo checkout master ...
git co master
echo pull from origin ...
git pull
bundle
yarn
rake db:migrate
