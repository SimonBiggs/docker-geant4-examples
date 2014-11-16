FROM simonbiggs/geant4

MAINTAINER Simon Biggs <mail@simonbiggs.net>

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir ~/github/; \
    cd ~/github/; \
    git clone https://github.com/jrjohansson/scientific-python-lectures.git ; \
    git clone https://github.com/SimonBiggs/ipython-geant4-linac.git
    
RUN cp -r ~/github/ipython-geant4-linac ~/notebooks/linac-example ; \
    cp -r ~/github/scientific-python-lectures ~/notebooks/lectures-learning-python
    
RUN ipython3 -c '%install_ext http://raw.github.com/jrjohansson/version_information/master/version_information.py'

WORKDIR /root/notebooks/

EXPOSE 8888

RUN echo '#/bin/bash' > start_geant4_notebook.sh; \
    echo 'cd /usr/local/bin/' >> start_geant4_notebook.sh; \
    echo '. geant4.sh' >> start_geant4_notebook.sh; \
    echo 'cd /root/notebooks/' >> start_geant4_notebook.sh; \
    echo 'ipython3 notebook --no-browser --ip=0.0.0.0 --port=8888' >> start_geant4_notebook.sh; \
    chmod +x start_geant4_notebook.sh

CMD ./start_geant4_notebook.sh
