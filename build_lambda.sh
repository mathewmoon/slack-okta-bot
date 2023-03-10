#!/bin/bash

VERSION=$1

if [[ -z "$VERSION" ]]; then
  echo "Version number required as first argument"
  exit 1
fi

if ! which sed; then
  alias sed=gsed
fi

if ! which poetry; then
  pip install poetry
fi

ZIP_FILE="slack-okta-bot-${VERSION}.zip"
pip install  slack-okta-bot -t package
cd package
zip -r ../${ZIP_FILE} . -x '*.pyc'
