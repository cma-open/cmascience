#!/bin/bash

codedir="$(dirname "$PWD")"
echo "-----------"
echo "Code directory root for formatting"
echo "$codedir" # reminder: Canonical quoting
echo "$codedir/cmascience"
echo "$codedir/tests"
echo "-----------"

# run black autoformatting against named directories
black "$codedir/cmascience"
black "$codedir/tests"