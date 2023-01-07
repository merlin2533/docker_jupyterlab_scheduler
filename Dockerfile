FROM jupyter/scipy-notebook

USER root

RUN apt-get update
RUN apt-get install -y cron vim

# Switch back to Jupyter user
USER $NB_USER

RUN fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# Set USER to the env variable jupyter uses for the default account
ENV USER=$NB_USER
RUN pip install jupyterlab_scheduler
RUN jupyter labextension install jupyterlab_scheduler