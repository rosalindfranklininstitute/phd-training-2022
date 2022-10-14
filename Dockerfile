FROM jupyter/scipy-notebook

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

# Switch to root to install packages
USER root

# install additional packages
RUN apt-get update --yes && apt-get install --yes curl wget patch

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

# Clone down the repo so we have all code locally
RUN conda install -c alubbock pysb