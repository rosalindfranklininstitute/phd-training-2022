from jupyter/scipy-notebook

# Switch to root to install packages
USER root

# install additional package...
RUN apt-get update --yes && apt-get install --yes curl wget patch

# Clone down the repo so we have all code locally
RUN conda install -c alubbock pysb