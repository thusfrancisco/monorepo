#!/bin/bash
NAME=$1
LIB_DIRECTORY=libs/frontend/$NAME-fn

# Create lib directory
mkdir $TARGET/$LIB_DIRECTORY

# Copy package.json file to it and replace {{PACKAGE}} by $NAME
cat scripts/lib-frontend-fn/files/package.json > $TARGET/$LIB_DIRECTORY/package.json
sed -i -e "s/{{PACKAGE}}/$NAME/g" $TARGET/$LIB_DIRECTORY/package.json

# Create TS file with lib name
touch $TARGET/$LIB_DIRECTORY/$NAME.ts
