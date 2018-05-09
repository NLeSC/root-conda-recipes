
To build: (from the base conda-recipes directory)
---------------
```
CONDA_PY=x ROOT_VERSION=y conda build root-numpy
```

where ```x``` is the version of Python you want to build against (2.7 and 3.4 for now), and ```y``` is the ROOT version (root-numpy is built against
a specific ROOT version)

For example:
```
CONDA_PY=3.4 ROOT_VERSION=5.34 conda build root-numpy
```
