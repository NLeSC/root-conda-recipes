# Updating the recipes
Building a conda package with conda build involves creating a conda recipe. The recipe is a flat directory holding metadata and the scripts needed to build the package.

The files in a conda recipe are:
* **meta.yaml** (metadata file)
* **build.sh** (Unix build script which is executed using bash)
* **bld.bat** (Windows build script which is executed using cmd)

In our conda github repository, each folder contains the recipe for a particular software package. For example:
![](gitbook2.png)
There could also be other optional files, like patches, scripts for testing, and to optionally execute after installation etc. See more details on the official [conda guidelines page](http://conda.pydata.org/).

The ```meta.yaml``` file  (more details [here](http://conda.pydata.org/docs/building/meta-yaml.html)) contains all the metadata: the package name, version, source code repository, build number, etc.



