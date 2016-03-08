# Updating the recipes
Building a conda package with conda build involves creating a conda recipe. The recipe is a flat directory holding metadata and the scripts needed to build the package.

The files in a conda recipe are:
* **meta.yaml** (metadata file)
* **build.sh** (Unix build script which is executed using bash)
* **bld.bat** (Windows build script which is executed using cmd)

In our conda github repository, each folder contains the recipe for a particular software package. For example:

![](gitbook2.png)
There could also be other optional files, like patches, scripts for testing, and to optionally execute after installation etc. See more details on the official [conda guidelines page](http://conda.pydata.org/).

```meta.yaml``` (more details [here](http://conda.pydata.org/docs/building/meta-yaml.html)) contains all the metadata: the package name, version, source code repository, build number, dependencies, etc.

```build.sh``` is a script used for building the binary, as specified in the ```meta.yaml``` file. 


---


The details of writing a recipe are beyond the scope of these guidelines, here we only point out some rules of thumb for updating the recipes, especially those for building ROOT.

* **Always increase the build number** in ```meta.yaml``` whenever you change anything in the recipe and you plan on re-building and publishing a new conda package. If you do not update the build number, and publish your new package on the Anaconda Cloud, a user will not pickup your fresh binary. Conda will compare the build number of the user's installation with the one on the Anaconda Cloud, and conclude that there is no new release of your package. 
* **Keep the package name in ```meta.yaml``` consistent** (aka don't change it). This is the name that will be used with ```conda install <package-name>``` so it should typically not contain version information or anything else.
* The ```build.sh``` contains instructions like you would typically build a package/binary outside of the conda environment. For example, for ROOT, it contains:


```
cmake ../ -DCMAKE_INSTALL_PREFIX=$PREFIX \
-Dbuiltin_llvm=ON \
-Dbuiltin-lzma=ON \
-Dbuiltin_zlib=ON \
-Dbuiltin_freetype=ON \
-Dcxx11=ON \
-Drpath=ON \
-Droofit=ON \
-Dopengl=OFF \
-Dgviz=OFF \
|| return 1;
#-DCMAKE_C_COMPILER=$PREFIX/bin/gcc \
#-DCMAKE_CXX_COMPILER=$PREFIX/bin/c++ \
#-Dbuiltin_pcre=ON \

#-Dbuiltin_gsl=ON \

make -j2 || return 1;
make install || return 1;

return 0;
```
**If you want to enable or disable some module of ROOT**, this is where you should do it. Python packages have a simpler ```build.sh``` content, could amount to even one line:

```
 $PYTHON setup.py install || return 1;
```
* Keep the conda package version number intact with the version of the software you are building.
 








