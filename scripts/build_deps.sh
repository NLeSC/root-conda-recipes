#!/bin/bash

echo "Running " $0

echo -e "Building root-numpy package\n"
conda build ./dependencies/root-numpy

echo -e "Building root-pandas package\n"
conda build ./dependencies/root-pandas

echo -e "Building rootpy package\n"
conda build ./dependencies/rootpy
