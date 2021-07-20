#!/bin/bash

set -e

cd /home/agnyp/dev/clark/application
echo [Script]Running in $(pwd) ...

echo [Script]checkout master ...
git co master

echo
echo [Script]pull from origin ...
git pull
bundle
yarn

echo
echo "[Script]migrating dev && test"
rake db:migrate && RAILS_ENV=test rake db:migrate
git co -

echo
echo [Script]changing directory back ...
cd -
