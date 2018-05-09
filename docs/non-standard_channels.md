# Non-standard channels

Binary packages can have different labels, the default one being `main`. Sometimes binaries are labeled with `dev` (e.g., newer versions which are pending certain tests), which makes them invisible from your anaconda client, unless you explicitly add the corresponding channel to that label, to your configuration:

```
$ conda config --add channels https://conda.anaconda.org/nlesc/label/dev
```
**Beware**: means that when you update or install binaries, you may pickup a newer version of a package, which has not been tested and put in "production" yet. **A safer way** to grab a binary from such a non-standard channel is to rather use directly:
```
conda install -c https://conda.anaconda.org/nlesc/label/dev <package>
```
Upon request, we build binaries with updated versions of ROOT and Python and temporarily put them in the `dev` channel, until properly tested. 
Fo example, ROOT 6.06 has new support for jupyter notebooks, or use JSROOT to implement ROOT graphics for web browsers. Currently in the `dev` channel we provide:

|   | ROOT | ROOT | ROOT |
| ---| ------------- |-------------| -------------:|
| **Python**| 2.7 / 6.05.02 | 3.4 / 6.05.02 | 3.5 / 6.05.02| 

The server can be tested with:
```
serv = new THttpServer("http:8080");
```
