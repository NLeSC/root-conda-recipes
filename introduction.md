# Introduction

This repository contains Conda recipes for building ROOT binaries and its dependencies.  The goal is to provide a pythonic interface to the ROOT I/O format, primarily for loading and saving *Pandas DataFrames* in the *ROOT* format.

The most painful thing for making things work is the ABI (binary) compatibility between different gcc(libstdc++)/glibc library versions, on various linux distributions.
Typically ROOT would even complain when the GCC headers are not of the same version as the one used for building it, so shipping the full GCC as a run dependency together with ROOT, seems like the best solution.