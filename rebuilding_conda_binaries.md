# Rebuilding Conda binaries

The binaries were built on a Scientific Linux 6.7 (Carbon). The default GCC (4.4.7) is too old for ROOT6, so I used the [Developer Toolset (v2) from CERN](http://linux.web.cern.ch/linux/devtoolset).
(provides everything you need to rebuild from the recipes: gcc/binutils/git/etc..)
If you really want to rebuild your own binaries (typically not needed as we try keep them updated), you can:
 - use a VM: pickup a VirtualBox image from [here](https://virtualboximages.com/VirtualBox+Scientific+Linux+Images), or create your own based on the ISO images from [here](https://www.scientificlinux.org/downloads/). 
Check [this guide](http://perso.crans.org/~raffo/cern-scientific-linux.php) for instructions on creating a VM. 

 - Much easier: [Docker image](https://hub.docker.com/r/remenska/slc6-devtoolset-2/) ready with the Developer Toolset (v2), Anaconda installed and this git repository with the recipes pulled.

I have tested things on: Ubuntu 11.10, 12.04, 14.04, 15.04, SLC-6.7, SLC-7. Please try it out and let me know if you experience problems. 
