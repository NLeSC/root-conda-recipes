#!/bin/bash

echo "Running " $0
pwd
ls

echo "Building rootpy package"
conda build ./dependencies/rootpy
