#!/bin/bash
# IDENT_REGEX= \"[a-f0-9]{8}\"|\'[a-f0-9]{8}\'|\ [a-f0-9]{8}\ |\[[a-f0-9]{8}|[a-f0-9]{8}\]
REGED=$(git diff --unified=0 origin/master... -- *.{js,rb} | grep --color -nE "\"[a-f0-9]{8}\"|\'[a-f0-9]{8}\'|\ [a-f0-9]{8}\ |\[[a-f0-9]{8}|[a-f0-9]{8}\]")
if [[ -n $REGED ]]; then
  echo "found new idents introduced in the code"
  echo $REGED
  exit 1
fi

