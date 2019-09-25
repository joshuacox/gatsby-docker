#!/bin/sh
set -e

export GATSBY_DIR="/site"
export PATH="$PATH:/usr/local/bin/gatsby"

# Initialize Gatsby or run NPM install if needed
if [ ! -f "$GATSBY_DIR/package.json" ]
then
  echo "Initializing Gatsby..."
  gatsby new $GATSBY_DIR

else
  if [ ! -e "$GATSBY_DIR/node_modules/" ]
  then
    echo "Node modules is empty. Running npm install..."
    npm install

  fi

fi

serve_gatsby () {
  rm -rf $GATSBY_DIR/public
  gatsby build
  gatsby serve --port 8000
}

dev_gatsby () {
  rm -rf $GATSBY_DIR/public
  gatsby develop --host 0.0.0.0
}

# Decide what to do
if  [ "$1" == "develop" ]
then
  dev_gatsby
elif  [ "$1" == "build" ]
then
  rm -rf $GATSBY_DIR/public
  gatsby build
elif  [ "$1" == "serve" ]
then
  serve_gatsby
elif  [ "$1" == "stage" ]
then
  serve_gatsby
else
  exec $@
fi



