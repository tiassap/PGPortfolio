FROM tensorflow/tensorflow:1.0.0.2-devel-gpu-py3
# source: https://hub.docker.com/layers/tensorflow/tensorflow/1.0.0.2-devel-gpu-py3/images/sha256-f8c8f5d8bab09c488a65cb7fccfe3a717dd0fc849c9132a50913ee901a5dff38?context=explore

SHELL ["/bin/bash", "-c"]

# Update apt repositories and install utils
RUN apt-get update -q && DEBIAN_FRONTEND=noninteractive apt-get install -y wget libgl1-mesa-glx libosmesa6 && apt-get install python3-tk -y

# Set working directory
WORKDIR /home/PGportfolio

# pip install 
ADD ./docker/requirements.txt /home/PGportfolio
RUN pip install -r requirements.txt
