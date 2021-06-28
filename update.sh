#!/bin/bash

set -e

echo Running in $(pwd) ...
bundle
yarn
rake db:migrate
