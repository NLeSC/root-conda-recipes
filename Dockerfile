# the image is also available ready-made on DockerHub: remenska/slc6-devtoolset-anaconda
FROM ringo/scientific:6.5
MAINTAINER Daniela Remenska <d.remenska@esciencecenter.nl>
ENTRYPOINT ["/bin/bash"]
RUN wget -O /etc/yum.repos.d/slc6-devtoolset.repo http://linuxsoft.cern.ch/cern/devtoolset/slc6-devtoolset.repo
RUN yum install -y devtoolset-2
RUN wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
RUN /bin/bash Miniconda-latest-Linux-x86_64.sh -b -p conda
ENV PATH=/conda/bin:$PATH
RUN source conda/bin/activate root
RUN conda/bin/conda update --yes -q conda
RUN conda/bin/conda update --yes --all
RUN conda/bin/conda config --add channels https://conda.binstar.org/NLeSC
RUN conda/bin/conda config --add channels https://conda.binstar.org/auto
RUN conda/bin/conda config --add channels defaults
RUN conda/bin/conda config --set show_channel_urls yes
RUN conda/bin/conda install --yes -q conda-build
RUN conda/bin/conda install --yes jinja2
RUN conda/bin/conda install --yes anaconda-client
RUN scl enable devtoolset-2 bash
ENV PATH /opt/rh/devtoolset-2/root/usr/bin:$PATH
RUN gcc --version & conda --version
# RUN CONDA_PY=2.7 conda build conda-recipes/root5
# RUN CONDA_PY=3.4 conda build conda-recipes/root5
# RUN CONDA_PY=2.7 conda build conda-recipes/root6
# RUN CONDA_PY=3.4 conda build conda-recipes/root6
