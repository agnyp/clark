#!/bin/bash

set -e

write_info() {
  echo
  echo [Script] $1
}

cd /home/agnyp/dev/clark/application
write_info "Running in $(pwd) ..."

write_info " Stashing changes ..."
git stash

write_info "checkout master ..."
git co master

write_info "pull from origin ..."
git pull
bundle
yarn

write_info "migrating dev && test"
rake db:migrate && RAILS_ENV=test rake db:migrate
git co -

write_info " Popping stashed changes ..."
git stash pop

write_info "changing directory back ..."
cd -

