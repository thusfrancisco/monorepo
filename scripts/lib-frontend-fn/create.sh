#!/bin/bash
NAME=$1
LIB_DIRECTORY=libs/frontend/$NAME-fn

# Create lib directory
mkdir $LIB_DIRECTORY

# Copy package.json file to it and replace {{PACKAGE}} by $NAME
cat scripts/lib-frontend-fn/files/package.json > $LIB_DIRECTORY/package.json
sed -i -e "s/{{PACKAGE}}/$NAME/g" $LIB_DIRECTORY/package.json

# Create TS file with lib name
touch $LIB_DIRECTORY/$NAME.ts
