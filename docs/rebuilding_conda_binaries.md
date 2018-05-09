# Rebuilding Conda binaries

The binaries were built on a Scientific Linux 6.7 (Carbon). The default GCC (4.4.7) is too old for ROOT6, so we used the [Developer Toolset (v2) from CERN](http://linux.web.cern.ch/linux/devtoolset). It provides everything you need to rebuild from the recipes: gcc/binutils/git/etc..
If you really want to rebuild or update the Anaconda binaries (typically not needed as we try keep them updated), you can:
 - use a VM: pickup a VirtualBox image from [here](https://virtualboximages.com/VirtualBox+Scientific+Linux+Images), or create your own based on the ISO images from [here](https://www.scientificlinux.org/downloads/). 
Check [this guide](http://perso.crans.org/~raffo/cern-scientific-linux.php) for instructions on creating a VM. 

 - Much easier: [Docker image](https://hub.docker.com/r/nlesc/slc6-devtoolset-anaconda/) ready with the Developer Toolset (v2), cmake, Anaconda installed and this git repository with the recipes pulled.

To be able to build conda packages, you need to have the conda-build package installed:

```
conda install conda-build
```
From the top directory of this cloned github repository of recipes, building a package is as easy as:
```
conda build ./directory-of-package-recipe
```

**For packages which depend on Python (e.g., ROOT)**, you need to build a separate binary for each Python version you want to provide. Simply pass the CONDA_PY variable to the same command:

```
CONDA_PY={python-version} conda build ./directory-of-package-recipe
```
Remember, you need to build separately each such binary.

Working ROOT has been tested on: Ubuntu 11.10, 12.04, 14.04, 15.04, SLC-6.7, SLC-7. Please try it out and let us know if you experience problems. 

**For packages which depend on ROOT (e.g., root-numpy)**, you need to, in addition, pass the ROOT version against which they should be build. For example:

```
CONDA_PY=3.4 ROOT_VERSION=5.34 conda build ./root-numpy
```
