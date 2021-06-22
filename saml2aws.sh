#!/bin/bash

set -eu

saml2aws configure \
    --idp-provider KeyCloak \
    --url https://keycloak.identity.flfinteche.de/auth/realms/FL%20Fintech%20E/protocol/saml/clients/amazon-aws

exit 0

CURRENT_VERSION=$(curl -Ls https://api.github.com/repos/Versent/saml2aws/releases/latest | grep 'tag_name' | cut -d'v' -f2 | cut -d'"' -f1)
wget -c https://github.com/Versent/saml2aws/releases/download/v${CURRENT_VERSION}/saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz -O - | tar -xzv -C ~/.local/bin
echo 'modding...'
chmod u+x ~/.local/bin/saml2aws

echo 'hashing...'
hash -r
echo 'version...'
saml2aws --version

