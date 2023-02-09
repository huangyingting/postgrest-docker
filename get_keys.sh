#!/bin/bash
set -a
source .env
set +a

curl https://login.microsoftonline.com/$TENANT_ID/discovery/v2.0/keys --output keys.json