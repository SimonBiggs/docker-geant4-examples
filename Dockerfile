
FROM simonbiggs/geant4

MAINTAINER Simon Biggs <mail@simonbiggs.net>

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /root/github/; \
    cd /root/github/
    
RUN git clone https://github.com/jrjohansson/scientific-python-lectures.git ; \
    git clone https://github.com/SimonBiggs/ipython-geant4-linac.git
    
RUN cp -r /root/github/ipython-geant4-linac /root/notebooks/linac-example ; \
    cp -r /root/github/scientific-python-lectures /root/notebooks/lectures-learning-python
    

WORKDIR /root/notebooks/

EXPOSE 8888

CMD ipython3 notebook --no-browser --ip=0.0.0.0 --port=8888
