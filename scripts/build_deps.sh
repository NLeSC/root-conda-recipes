#!/bin/bash

echo "Running " $0

echo "Building rootpy package"
conda build ./dependencies/rootpy

echo "Building root-numpy package"
conda build ./dependencies/root-numpy

echo "Building root-pandas package"
conda build ./dependencies/root-pandas
