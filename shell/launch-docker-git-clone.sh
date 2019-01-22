#!/bin/sh

docker run -it --rm -p 8888:8888 oxtr-ko_2017.03:v1.0 /bin/bash -c \
	"git clone https://github.com/Neuroinflab/PyMICE.git \
	/home/jovyan/work && source activate oxtr-ko_2017.03 \
	&& jupyter notebook"
