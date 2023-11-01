#|/bin/bash
NAME=$1
NAME=${NAME:-assets}

mkdir $TARGET/$NAME

# Copy files to $TARGET assets directory
cp -a assets/files/. $TARGET/$NAME/
