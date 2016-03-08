# Known issues

ROOT is dynamically linked against glibc. If you experience errors like the following:

``` root: /lib64/libc.so.6: version `GLIBC_2.{some_old_version}' not found 
(required by /anaconda/envs/testenv/bin/../lib/libstdc++.so.6) ```

or

``` ImportError: anaconda/envs/testenv/lib/libPyROOT.so: ELF file OS ABI invalid ```

this means that you deployed ROOT on a machine with a very old glibc version, and you need to upgrade your distro. 
