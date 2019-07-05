
# Galaxy - Basic Bioinformatics Concepts, Databases and Tools
#
# to build the docker image, go to root of training repo and
#    docker build -t basic-bioinformatics -f topics/basic-bioinformatics/docker/Dockerfile .
#
# to run image:
#    docker run -p "8080:80" -t basic-bioinformatics

FROM bgruening/galaxy-stable

MAINTAINER Galaxy Training Material

ENV GALAXY_CONFIG_BRAND "GTN: Basic Bioinformatics Concepts, Databases and Tools"

# prerequisites
RUN pip install ephemeris -U
ADD bin/galaxy-sleep.py /galaxy-sleep.py

# copy the tutorials directory for your topic
ADD topics/basic-bioinformatics/tutorials/ /tutorials/

# install everything for tutorials
ADD bin/docker-install-tutorials.sh /setup-tutorials.sh
ADD bin/mergeyaml.py /mergeyaml.py
RUN /setup-tutorials.sh