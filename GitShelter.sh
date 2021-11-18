#!/bin/bash

# Source print script
source bin/prnt.sh

prnt_line ERROR "hello world"

# If no parameters are provided is provided
if (( $# == 0 ));
then

# Output error
echo "Path to config-file is not provided as parameter!"

fi
