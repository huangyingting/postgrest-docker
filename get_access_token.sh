#!/bin/bash
set -a
source .env
set +a

urlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02X' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"
}

SCOPE_ENCODED=$(urlencode $SCOPE)

echo $(curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "client_id=$CLIENT_ID&scope=$SCOPE_ENCODED&client_secret=$CLIENT_SECRET&grant_type=client_credentials" https://login.microsoftonline.com/$TENANT_ID/oauth2/v2.0/token | jq '.access_token' | sed -e 's/^"//' -e 's/"$//')
