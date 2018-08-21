# ==================================================================
# Base
# ------------------------------------------------------------------
# OS		ubuntu 16.04
# CPU/GPU	gpu
# cuda		8.0
# cuDNN		5.1
# ------------------------------------------------------------------
ARG cuda_version=8.0
ARG cudnn_version=5


FROM nvidia/cuda:${cuda_version}-cudnn${cudnn_version}-devel-ubuntu16.04
# FROM nvidia/cuda:8.0-cudnn5.1-devel-ubuntu16.04
# ==================================================================

	
# ==================================================================
# module list
# ------------------------------------------------------------------
# python        2.7    (apt)
# torch         latest (git) x
# chainer       latest (pip) x
# cntk          latest (pip) x
# jupyter       latest (pip)
# mxnet         latest (pip) x
# pytorch       0.4.0  (pip) x
# tensorflow    1.4.1  (pip)
# theano        1.0.1  (git) x
# keras         2.1.1  (pip)
# lasagne       latest (git) x
# opencv        3.4.1  (git) x
# sonnet        latest (pip) x
# caffe         latest (git) x
# caffe2        latest (git) x
# ==================================================================


# ==================================================================
# basic setting
# ------------------------------------------------------------------
RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
    PIP_INSTALL="python -m pip --no-cache-dir install --upgrade" && \
    GIT_CLONE="git clone --depth 10" && \

    rm -rf /var/lib/apt/lists/* \
           /etc/apt/sources.list.d/cuda.list \
           /etc/apt/sources.list.d/nvidia-ml.list && \

    apt-get update && \


# ==================================================================
# tools ON
# ------------------------------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        build-essential \
        ca-certificates \
        cmake \
        wget \
        git \
        vim \
        && \


# ==================================================================
# python 2.7 ON
# ------------------------------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        python-pip \
        python-dev \
        && \
    $PIP_INSTALL \
        setuptools \
        pip \
        && \
    $PIP_INSTALL \
        numpy \
        scipy \
        pandas \
        scikit-learn \
        matplotlib \
        Cython \
        && \

# ==================================================================
# python 3.6 OFF
# ------------------------------------------------------------------

#    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
#        software-properties-common \
#        && \
#    add-apt-repository ppa:deadsnakes/ppa && \
#    apt-get update && \
#    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
#        python3.6 \
#        python3.6-dev \
#        && \
#    wget -O ~/get-pip.py \
#        https://bootstrap.pypa.io/get-pip.py && \
#    python3.6 ~/get-pip.py && \
#    ln -s /usr/bin/python3.6 /usr/local/bin/python3 && \
#    ln -s /usr/bin/python3.6 /usr/local/bin/python && \
#    $PIP_INSTALL \
#        setuptools \
#        && \
#    $PIP_INSTALL \
#        numpy \
#        scipy \
#        pandas \
#        scikit-learn \
#        matplotlib \
#        Cython \
#        && \



# ==================================================================
# tensorflow 1.4.1
# ------------------------------------------------------------------

    $PIP_INSTALL \
        tensorflow-gpu==1.4.1 \	
        && \

# for tensorflow latest version
# tensorflow-gpu==1.10.0 -> tensorflow-gpu


# ==================================================================
# keras 2.1.0 ON
# ------------------------------------------------------------------

    $PIP_INSTALL \
        h5py \
        keras==2.1.1 \
        && \

# for keras latest version
# keras==2.2.0 --> keras


# ==================================================================
# jupyter latest ON
# ------------------------------------------------------------------

    $PIP_INSTALL \
        jupyter \
        && \



# ==================================================================
# opencv 3.4.1 OFF
# ------------------------------------------------------------------

#    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
#        libatlas-base-dev \
#        libgflags-dev \
#        libgoogle-glog-dev \
#        libhdf5-serial-dev \
#        libleveldb-dev \
#        liblmdb-dev \
#        libprotobuf-dev \
#        libsnappy-dev \
#        protobuf-compiler \
#        && \

#    $GIT_CLONE --branch 3.4.1 https://github.com/opencv/opencv ~/opencv && \
#    mkdir -p ~/opencv/build && cd ~/opencv/build && \
#    cmake -D CMAKE_BUILD_TYPE=RELEASE \
#          -D CMAKE_INSTALL_PREFIX=/usr/local \
#          -D WITH_IPP=OFF \
#          -D WITH_CUDA=OFF \
#          -D WITH_OPENCL=OFF \
#          -D BUILD_TESTS=OFF \
#          -D BUILD_PERF_TESTS=OFF \
#          .. && \
#    make -j"$(nproc)" install && \


# ==================================================================
# config & cleanup
# ------------------------------------------------------------------

    ldconfig && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/*



# ==================================================================
# tensorboard : 6006 , jupyter notebook : 8888
# ------------------------------------------------------------------
EXPOSE 8888 6006



# ==================================================================
# shared volume , -v $(pwd):/home/project
# ------------------------------------------------------------------
RUN mkdir -p /home/project
WORKDIR /home/project


# ==================================================================
# check install
# ------------------------------------------------------------------
RUN python --version
# RUN python -c 'import tensorflow as tf; print tf.__version__'
# RUN python -c 'import keras ; print keras.__version__'


# ==================================================================
# nvidia-docker hooks
# ------------------------------------------------------------------
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

