FROM ubuntu:latest

MAINTAINER iain mackie

# Install essentials
RUN apt-get update && apt-get install \
  	-y --no-install-recommends python3 python3-virtualenv \
    	&& apt-get install git -y 


# Pull required code
RUN git clone https://github.com/gsgoncalves/bert4trec 

# Build virtualenv
RUN python3 -m virtualenv --python=/usr/bin/python3 /opt/venv
RUN . /opt/venv/bin/activate && pip install -r bert4trec/requirements.txt

WORKDIR 
CMD . /opt/venv/bin/activate && exec python bert4trec/run_treccar.py

