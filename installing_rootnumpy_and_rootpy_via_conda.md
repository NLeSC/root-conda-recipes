# Installing root_numpy and rootpy via conda

We also provide conda distributions of [root-numpy](https://github.com/rootpy/root_numpy) (the interface between [ROOT](https://root.cern.ch/) and [NumPy](http://www.numpy.org/)) and [rootpy](https://github.com/rootpy/rootpy). When installing root-numpy, ROOT's latest version will be picked up as a dependency:

```
$ conda install root-numpy
```
as can be seen from the conda installation plan, the currently-latest (6.04) ROOT version will be picked up:

```
....
The following NEW packages will be INSTALLED:
    ...
    numexpr:       2.4.6-np110py27_1    defaults                                 
    numpy:         1.10.4-py27_1        defaults                                
    readline:      6.2.5-15             https://conda.binstar.org/NLeSC/linux-64/
    root:          6.04-py2.7_gcc4.8.2  https://conda.binstar.org/NLeSC/linux-64/
    root-numpy:    4.4.0-root6.04_py2.7 https://conda.binstar.org/NLeSC/linux-64/    
    ...           

Proceed ([y]/n)? 

```
If you rather want to have another ROOT version picked up as a dependency, use:

```
$ root-numpy root=5
```
Now conda proposes:
```
The following NEW packages will be INSTALLED:
    ...
    root:          5.34.32-py2.7_gcc4.8.2  https://conda.binstar.org/NLeSC/linux-64/
    root-numpy:    4.4.0-root5.34.32_py2.7 https://conda.binstar.org/NLeSC/linux-64/
    ...             
    
  ```
 When installing rootpy, both root-numpy and ROOT will be picked up as dependencies automatically. The same above holds for fixing your ROOT or Python version.
