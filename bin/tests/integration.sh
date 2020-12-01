#!/bin/bash

rootdir="$(dirname $(dirname "$PWD"))"
testdir="$rootdir/tests/integration"

echo "----------"
echo "$rootdir"
echo "$testdir"
echo "----------"


# Discover and run tests on code path,  -v verbose flag
#python3 -m pytest -v --capture=tee-sys  $testdir
pytest -v --capture=tee-sys -rA  $testdir


