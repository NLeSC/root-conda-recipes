This repository contains Conda recipes for: *ROOT5/6* binaries,*root_numpy, rootpy, rooot_pandas* (and related dependencies), with Python 2/3 support. The goal is to provide a pythonic interface to the ROOT I/O format, primarily for loading and saving *Pandas DataFrames* in the *ROOT* format.
The most painful thing for making things work is the ABI (binary) compatibility between different gcc(libstdc++)/glibc library versions, on various linux distributions.

Typically ROOT would even complain when the GCC headers are not of the same version as the one used for building it, so shipping the full GCC as a run dependency together with ROOT, seems like the best solution.

The binaries were built on a Scientific Linux 6.7 (Carbon). The default GCC (4.4.7) is too old for ROOT6, so I used the [Developer Toolset (v2) from CERN](http://linux.web.cern.ch/linux/devtoolset).
(provides everything you need to rebuild from the recipes: gcc/binutils/git/etc..)
I have tested things on: Ubuntu 11.10, 12.04, 14.04, 15.04, SLC-6.7, SLC-7. Please try it out and let me know if you experience problems. 
```
$ conda config --add channels https://conda.binstar.org/NLeSC
$ conda create --name=testenv root=6 python=3
$ source activate testenv
$ root -b -q
$ source {PATH_TO_YOUR_ANACONDA_DIR}/envs/testenv/bin/thisroot.sh
$ python
Type "help", "copyright", "credits" or "license" for more information.
>>> import ROOT
>>> f = ROOT.TFile.Open("test.root","recreate")
```

If you have other channels in your conda configuration (besides the defaults one), make sure that the following packages are picked up from the right one (NLeSC) when you create the new environment.
(You may need to set ``` conda config --set show_channel_urls yes ```).
```
....
    fftw:       3.3.4-0                https://conda.binstar.org/NLeSC/linux-64/
    gmp:        5.1.2-2                https://conda.binstar.org/NLeSC/linux-64/
    graphviz:   2.38.0-3               https://conda.binstar.org/NLeSC/linux-64/
    gsl:        1.16-1                 https://conda.binstar.org/NLeSC/linux-64/
    isl:        0.12.2-0               https://conda.binstar.org/NLeSC/linux-64/
    mpc:        1.0.1-0                https://conda.binstar.org/NLeSC/linux-64/
    mpfr:       3.1.2-0                https://conda.binstar.org/NLeSC/linux-64/
    ncurses:    5.9-5                  https://conda.binstar.org/NLeSC/linux-64/
    pcre:       8.35-0                 https://conda.binstar.org/NLeSC/linux-64/
    gcc:        4.8.2-20               https://conda.binstar.org/NLeSC/linux-64/
    readline:   6.2.5-11               https://conda.binstar.org/NLeSC/linux-64/
....
```
ROOT is dynamically linked against glibc. If you experience errors like the following:

``` root: /lib64/libc.so.6: version `GLIBC_2.{some_old_version}' not found 
(required by /anaconda/envs/testenv/bin/../lib/libstdc++.so.6) ```

or

``` ImportError: anaconda/envs/testenv/lib/libPyROOT.so: ELF file OS ABI invalid ```

this means that you deployed ROOT on a machine with a very old glibc version, and you need to upgrade your distro. 

So far only there is only support for Linux 64bit. OSX is uncharted territory for me, and any help would be appreciated.

Thanks upfront for any feedback!

Daniela
