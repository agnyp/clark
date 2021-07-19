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

echo "migrating dev && test"
rake db:migrate && RAILS_ENV=test rake db:migrate
git co -

echo changing directory back ...
cd -
