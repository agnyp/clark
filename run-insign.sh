#!/bin/bash

set -eu

VERSION=latest
REPO=940354063714

# docker pull $REPO.dkr.ecr.eu-central-1.amazonaws.com/insign:$VERSION

# docker tag $REPO.dkr.ecr.eu-central-1.amazonaws.com/insign:$VERSION insign:$VERSION

docker run --name clark-insign -d --rm -it -p 8080:8080 insign:$VERSION

