
[![Build Status](https://api.travis-ci.org/remenska/root-conda-recipes.svg)](https://travis-ci.org/remenska/root-conda-recipes)

# Introduction

This repository contains Conda recipes for building CERN [ROOT](https://root.cern.ch/) binaries and its dependencies. For the needs of the [XENON Dark Matter project](http://xenon.astro.columbia.edu/), the goal is to provide a "pythonic" interface to the ROOT I/O format, primarily for loading and saving Pandas dataframes in the ROOT format. For this purpose, there are also recipes for building conda binaries of [root-numpy](https://github.com/rootpy/root_numpy) and [rootpy](https://github.com/rootpy/rootpy), the community-driven initiative to provide a more pythonic interface with ROOT on top of the existing PyROOT bindings. This work was done in collaboration with the Netherlands eScience Center.

The most most important thing for making things work out of the box is the ABI (binary) compatibility between different gcc(libstdc++)/glibc library versions, on various linux distributions. Typically ROOT would even complain when the GCC headers are not of the same version as the one used for building it, so shipping the full GCC and glibc as a run dependency together with ROOT, seemed like the best solution.

Rebuilding/Updating the binaries
=============
The binaries were built on a Scientific Linux 6.7 (Carbon). The default GCC (4.4.7) is too old for ROOT6, so I used the [Developer Toolset (v2) from CERN](http://linux.web.cern.ch/linux/devtoolset).
(provides everything you need to rebuild from the recipes: gcc/binutils/git/etc..)
If you really want to rebuild your own binaries (typically not needed as we try keep them updated), you can:
 - use a VM: pickup a VirtualBox image from [here](https://virtualboximages.com/VirtualBox+Scientific+Linux+Images), or create your own based on the ISO images from [here](https://www.scientificlinux.org/downloads/). 
Check [this guide](http://perso.crans.org/~raffo/cern-scientific-linux.php) for instructions on creating a VM. 

 - Much easier: [Docker image](https://hub.docker.com/r/remenska/slc6-devtoolset-2/) ready with the Developer Toolset (v2), Anaconda installed and this git repository with the recipes pulled.

I have tested things on: Ubuntu 11.10, 12.04, 14.04, 15.04, SLC-6.7, SLC-7. Please try it out and let me know if you experience problems. 

Using the conda binary packages
=============

```
$ conda config --add channels https://conda.anaconda.org/NLeSC
$ conda create --name=testenv root=6 python=3
$ source activate testenv
$ root -b -q
$ python
Type "help", "copyright", "credits" or "license" for more information.
>>> import ROOT
>>> f = ROOT.TFile.Open("test.root","recreate")
```

If you have other channels in your conda configuration (besides the defaults one), make sure that the following packages are picked up from the right one (NLeSC) when you create the new environment.
(You may need to set ``` conda config --set show_channel_urls yes ```).
```
....
    fftw:       3.3.4-0                https://conda.anaconda.org/NLeSC/linux-64/
    gmp:        5.1.2-2                https://conda.anaconda.org/NLeSC/linux-64/
    graphviz:   2.38.0-3               https://conda.anaconda.org/NLeSC/linux-64/
    gsl:        1.16-1                 https://conda.anaconda.org/NLeSC/linux-64/
    isl:        0.12.2-0               https://conda.anaconda.org/NLeSC/linux-64/
    mpc:        1.0.1-0                https://conda.anaconda.org/NLeSC/linux-64/
    mpfr:       3.1.2-0                https://conda.anaconda.org/NLeSC/linux-64/
    ncurses:    5.9-5                  https://conda.anaconda.org/NLeSC/linux-64/
    pcre:       8.35-0                 https://conda.anaconda.org/NLeSC/linux-64/
    gcc:        4.8.2-20               https://conda.anaconda.org/NLeSC/linux-64/
    readline:   6.2.5-11               https://conda.anaconda.org/NLeSC/linux-64/
....
```
ROOT is dynamically linked against glibc. If you experience errors like the following:

``` root: /lib64/libc.so.6: version `GLIBC_2.{some_old_version}' not found 
(required by /anaconda/envs/testenv/bin/../lib/libstdc++.so.6) ```

or

``` ImportError: anaconda/envs/testenv/lib/libPyROOT.so: ELF file OS ABI invalid ```

this means that you deployed ROOT on a machine with a very old glibc version, and you need to upgrade your distro. 

So far only there is only support for Linux 64bit. OSX is uncharted territory for me, and any help would be appreciated.

**Update**: ROOT5 works on OSX now!

*Please update your environment regularly, for new and more stable package releases*:

```
$ conda update --all 
$ conda update --yes -q conda
```
Thanks upfront for any feedback!

Daniela
