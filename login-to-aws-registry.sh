#!/bin/bash

REPO=972669253934
# REPO=586145886499
# REPO=940354063714
PROFILE=optisure

saml2aws login --force --profile $PROFILE --session-duration 43200
aws ecr get-login-password --region eu-central-1 --profile $PROFILE | docker login --username AWS --password-stdin $REPO.dkr.ecr.eu-central-1.amazonaws.com
