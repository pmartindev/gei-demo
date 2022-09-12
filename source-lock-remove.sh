#!/bin/bash

. setenv.sh

ID=`curl \
  -X GET \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: token $GH_SOURCE_PAT" \
  $GHES_API_URL/orgs/$SOURCE_ORG/migrations | jq -r '.[0].id' | xargs echo`

curl \
  -X DELETE \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: token $GH_SOURCE_PAT" \
  $GHES_API_URL/orgs/$SOURCE_ORG/migrations/$ID/repos/$CURRENT_REPO_NAME/lock