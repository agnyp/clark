#!/bin/bash

set -eu

VERSION=latest
REPO=940354063714

# docker pull $REPO.dkr.ecr.eu-central-1.amazonaws.com/hermes:$VERSION
# docker tag $REPO.dkr.ecr.eu-central-1.amazonaws.com/hermes:$VERSION hermes:$VERSION

# docker pull $REPO.dkr.ecr.eu-central-1.amazonaws.com/insign:$VERSION
# docker tag $REPO.dkr.ecr.eu-central-1.amazonaws.com/insign:$VERSION insign:$VERSION

docker run --name clark-hermes -d --rm -it -p 8801:8801 -p 9901:9901 -e WS_SHARED_SECRET=$WS_SHARED_SECRET hermes:$VERSION sh -c "node index.js"
docker run --name clark-insign -d --rm -it -p 8080:8080 insign:$VERSION
