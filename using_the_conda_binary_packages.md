# Using the conda binary packages

To use the conda binary packages from the NLeSC AnacondaCloud repository, you need to add the appropriate NLeSC channel.  
```
$ conda config --add channels https://conda.anaconda.org/NLeSC
```

Currently the following ROOT binaries with Python support are provided for the following versions in the `main` channel: 

|   | ROOT | ROOT |
| ---| ------------- |:-------------:| 
| **Python**| 2.7 / 5.34.32 | 3.4 / 5.34.32 |
| **Python** | 2.7 / 6.04  | 3.4 / 6.04 |


To install ROOT in your conda environment, decide upon the ROOT and Python version you plan to use. **We discourage** installing everything in your default (*root*) environment, and rather creating a separate one. For example:

```
$ conda create --name=testenv root=6 python=3
$ source activate testenv
```

Test if ROOT works like it should:

```
$ root -b -q
   ------------------------------------------------------------
  | Welcome to ROOT 6.05/02                http://root.cern.ch |
  |                               (c) 1995-2014, The ROOT Team |
  | Built for linuxx8664gcc                                    |
  | From tag v6-05-02, 14 September 2015                       |
  | Try '.help', '.demo', '.license', '.credits', '.quit'/'.q' |
   ------------------------------------------------------------

root [0] 
```
```
$ python
Type "help", "copyright", "credits" or "license" for more information.
Anaconda is brought to you by Continuum Analytics.
>>> import ROOT
>>> f = ROOT.TFile.Open("test.root","recreate")
```

If you have other channels in your conda configuration (besides the defaults one), make sure that the following packages are picked up from the right one (NLeSC) when you create the new environment.

You may need to set:
``` 
conda config --set show_channel_urls yes 
```
in order to see the channels from which the binaries are installed.

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