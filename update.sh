#!/bin/bash

set -e

cd /home/agnyp/dev/clark/application
echo Running in $(pwd) ...
echo checkout master ...
git co master
echo pull from origin ...
git pull
bundle
yarn
rake db:migrate
git co -

cd -
