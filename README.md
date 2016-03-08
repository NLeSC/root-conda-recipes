
[![Build Status](https://api.travis-ci.org/remenska/root-conda-recipes.svg)](https://travis-ci.org/remenska/root-conda-recipes)

# Introduction

This repository contains Conda recipes for building CERN [ROOT](https://root.cern.ch/) binaries and its dependencies. For the needs of the [XENON Dark Matter project](http://xenon.astro.columbia.edu/), the goal is to provide a "pythonic" interface to the ROOT I/O format, primarily for loading and saving Pandas dataframes in the ROOT format. For this purpose, there are also recipes for building conda binaries of [root-numpy](https://github.com/rootpy/root_numpy) and [rootpy](https://github.com/rootpy/rootpy), the community-driven initiative to provide a more pythonic interface with ROOT on top of the existing PyROOT bindings.

The most most important thing for making things work out of the box is the ABI (binary) compatibility between different gcc(libstdc++)/glibc library versions, on various linux distributions. Typically ROOT would even complain when the GCC headers are not of the same version as the one used for building it, so *shipping the full GCC and glibc as a run dependency* together with ROOT, seemed like the best solution.


Thanks upfront for any feedback!

Daniela
