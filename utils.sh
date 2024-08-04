#!/bin/bash

# Define the greet function
function init {
  # Create make.env file with MAKE_DIR=$SUBMODULE_DIR
  # Move surrogate.Makefile to parent directory
	echo "UTILS_DIR=$(notdir ${PWD})" > ../make.env
  export TARGET=$1
  export TARGET=${TARGET:-..}
}

# Define the add function
function setup-monorepo {
	. $UTILS_DIR/monorepo/setup_monorepo.sh $(NAME)
	. $UTILS_DIR/monorepo/setup_pnpm.sh
	cd monorepo
}

# Check the number of command-line arguments
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <function_name> [arguments...]"
  exit 1
fi

# Extract the function name and shift the arguments
function_name=$1
shift

# Call the specified function with the remaining arguments
case "$function_name" in
  "greet")
    greet "$@"
    ;;
  "add")
    add "$@"
    ;;
  *)
    echo "Unknown function: $function_name"
    exit 1
    ;;
esac
