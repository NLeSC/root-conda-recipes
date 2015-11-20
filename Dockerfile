FROM ringo/scientific:6.5
ENTRYPOINT ["/bin/bash"]
RUN wget -O /etc/yum.repos.d/slc6-devtoolset.repo http://linuxsoft.cern.ch/cern/devtoolset/slc6-devtoolset.repo
RUN yum install -y devtoolset-2
RUN wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
RUN bash Miniconda-latest-Linux-x86_64.sh -b -p conda
RUN . conda/bin/activate root
RUN conda update --yes -q conda
RUN conda update --yes --all
RUN conda config --add channels https://conda.binstar.org/NLeSC
RUN conda config --add channels https://conda.binstar.org/auto
RUN conda config --add channels defaults
RUN conda config --set show_channel_urls yes
RUN conda install --yes -q conda-build
RUN conda install --yes jinja2
RUN conda install --yes anaconda-client
RUN git clone  https://github.com/remenska/conda-recipes
RUN scl enable devtoolset-2 bash
