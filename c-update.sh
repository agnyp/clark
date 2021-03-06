#!/bin/bash

set -e

write_info() {
  echo
  echo $(tput setaf 0; tput setab 3)[Updater] $1 $(tput sgr0)
}
rebase_with_master() {
  read -p "rebase with master? (y/N)" fetch
  if [ "$fetch" = "y" ]; then
    write_info "Rebasing with master ..."
    git rebase master
    echo
  fi
}

cd /home/agnyp/dev/clark/application
write_info "Running in $(pwd) ..."

if [ -z "$(git status --porcelain)" ]; then
  WD_CLEAN=true
else
  WD_CLEAN=false
  write_info " Stashing changes ..."
  git stash
fi

write_info "fetch origin and checkout master ..."
git fetch --prune origin
git co master

write_info "pull from origin ..."
git pull
bundle
yarn

write_info "migrating dev ..."
rake db:migrate
write_info "migrating test ..."
RAILS_ENV=test rake db:migrate

write_info "checking out db/structure.sql ..."
git co -- db/structure.sql

write_info "changing back to branch ..."
git co -
current_branch=`git branch --show-current`
if [[ "$current_branch" != "master" ]]; then
  rebase_with_master
fi

if [ $WD_CLEAN == false ]; then
  write_info " Popping stashed changes ..."
  git stash pop
fi

write_info "changing directory back ..."
cd -

