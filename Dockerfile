
FROM simonbiggs/geant4

MAINTAINER Simon Biggs <mail@simonbiggs.net>

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir ~/github/; \
    cd ~/github/; \
    git clone https://github.com/jrjohansson/scientific-python-lectures.git ; \
    git clone https://github.com/SimonBiggs/ipython-geant4-linac.git
    
RUN cp -r ~/github/ipython-geant4-linac ~/notebooks/linac-example ; \
    cp -r ~/github/scientific-python-lectures ~/notebooks/lectures-learning-python
    

WORKDIR /root/notebooks/

EXPOSE 8888

RUN echo ' . geant4.sh' > start_geant4_notebook.sh; \
    echo 'ipython3 notebook --no-browser --ip=0.0.0.0 --port=8888' >> start_geant4_notebook.sh

CMD ./start_geant4_notebook.sh
