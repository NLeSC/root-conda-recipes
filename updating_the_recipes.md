# Updating the recipes
Building a conda package with conda build involves creating a conda recipe. The recipe is a flat directory holding metadata and the scripts needed to build the package.
The mandatory files in a conda recipe are:
* **meta.yaml** (metadata file)
* build.sh (Unix build script which is executed using bash)
* bld.bat (Windows build script which is executed using cmd)

![test 1 2 3 ](gitbook1.png)
There could also be other optional files, like patches, scripts for testing, and to optionally execute after installation etc. See more details on the official [conda guidelines page](http://conda.pydata.org/).
