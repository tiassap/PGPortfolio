FROM tensorflow/tensorflow:1.0.0-devel-py3
# source: https://hub.docker.com/layers/tensorflow/tensorflow/1.0.0-devel-py3/images/sha256-e4986e2ebaac9cb8c871f968d6383a74895a7d62593e07fe6c1968c048569b1b?context=explore

SHELL ["/bin/bash", "-c"]

# Update apt repositories and install utils
RUN apt-get update -q && DEBIAN_FRONTEND=noninteractive apt-get install -y wget libgl1-mesa-glx libosmesa6 && apt-get install python3-tk -y

# Set working directory
WORKDIR /home/PGportfolio

# pip install 
ADD ./docker/requirements.txt /home/PGportfolio
RUN pip install -r requirements.txt
