#!/bin/bash
set -eu

usage(){
    echo "Usage: $0 [OPTIONS]"

    echo "Run docker container."
    echo ""
    echo "Options:"
    echo "  -b      build docker image"
    echo "  -g      use GPU"
    echo "  -h      print this help"
}

# Set dir
DIR=$(dirname $(readlink -f "$0"))
cd $DIR

build=false
gpu=false

while getopts bgh OPT; do
    case $OPT in
        "b") build=true ;;
        "g") gpu=true ;;
        "h") usage ;;
        \?) usage ;;
    esac
done

if [ "$build" = true  ]; then
(
    if [ "$gpu" = true ]; then
    (
        echo "Build docker image using GPU"
        docker build -t pgportfolio_gpu -f ./docker/gpu.dockerfile .
    )
    else
    (
        echo "Build docker image using CPU"
        docker build -t pgportfolio -f ./docker/cpu.dockerfile .
    )
    fi
)
fi

if [ "$gpu" = true ]; then
(
    echo "run docker with GPU"
    docker run --rm -it -v ${DIR}:/home/PGportfolio --gpus all pgportfolio_gpu
)
else
(
    echo "run docker with CPU"
    docker run --rm -it -v ${DIR}:/home/PGportfolio pgportfolio
)
fi
