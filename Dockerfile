# the image is also available ready-made on DockerHub: remenska/slc6-devtoolset-anaconda
FROM ringo/scientific:6.5
MAINTAINER Daniela Remenska <d.remenska@esciencecenter.nl>
RUN yum install -y libX11-devel libXft-devel libXpm-devel libXext-devel
RUN wget -O /etc/yum.repos.d/slc6-devtoolset.repo http://linuxsoft.cern.ch/cern/devtoolset/slc6-devtoolset.repo
RUN yum install -y devtoolset-2
RUN wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
RUN /bin/bash Miniconda-latest-Linux-x86_64.sh -b -p conda
ENV PATH=/conda/bin:$PATH
RUN source conda/bin/activate root
RUN conda/bin/conda update --yes -q conda
RUN conda/bin/conda update --yes --all
ENV CONDARC /root/.condarc
RUN conda/bin/conda config --add channels https://conda.binstar.org/NLeSC
RUN conda/bin/conda config --add channels https://conda.binstar.org/auto
RUN conda/bin/conda config --add channels defaults
RUN conda/bin/conda config --set show_channel_urls yes
RUN conda/bin/conda install --yes -q conda-build
RUN conda/bin/conda install --yes jinja2
RUN conda/bin/conda install --yes anaconda-client
RUN conda/bin/conda install --yes binstar
RUN scl enable devtoolset-2 bash
ENV PATH /opt/rh/devtoolset-2/root/usr/bin:$PATH
RUN gcc --version & conda --version
RUN wget --no-check-certificate https://cmake.org/files/v3.4/cmake-3.4.0-Linux-x86_64.tar.gz
RUN tar -xvf cmake-3.4.0-Linux-x86_64.tar.gz
RUN ln -s /cmake-3.4.0-Linux-x86_64/bin/cmake /usr/bin/cmake
ENV PS1 "\u@\h:\w$ "
# RUN CONDA_PY=2.7 conda build conda-recipes/root5

