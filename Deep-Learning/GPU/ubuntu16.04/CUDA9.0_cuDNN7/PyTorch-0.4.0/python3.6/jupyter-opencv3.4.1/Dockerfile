# ==================================================================
# module list
# ------------------------------------------------------------------
# ubuntu	16.04
# CUDA		9.0
# cuDNN		7
# python        3.6    (apt)
# jupyter       latest (pip)
# pytorch       0.4.0  (pip) : CUDA dependent
# opencv        3.4.1  (git)
# ==================================================================

FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
    PIP_INSTALL="python -m pip --no-cache-dir install --upgrade" && \
    GIT_CLONE="git clone --depth 10" && \

    rm -rf /var/lib/apt/lists/* \
           /etc/apt/sources.list.d/cuda.list \
           /etc/apt/sources.list.d/nvidia-ml.list && \

    apt-get update && \

# ==================================================================
# tools
# ------------------------------------------------------------------
   DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        build-essential \
        ca-certificates \
        cmake \
        wget \
        git \
        && \

# ==================================================================
# python
# ------------------------------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        software-properties-common \
        && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        python3.6 \
        python3.6-dev \
        && \
    wget -O ~/get-pip.py \
        https://bootstrap.pypa.io/get-pip.py && \
    python3.6 ~/get-pip.py && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python3 && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python && \
    $PIP_INSTALL \
        setuptools \
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
# jupyter
# ------------------------------------------------------------------

    $PIP_INSTALL \
        jupyter \
	&& \


# ==================================================================
# pytorch
# ------------------------------------------------------------------

    $PIP_INSTALL \
        torch \
        torchvision \
	&& \

# ==================================================================
# more pakages for opencv image , video
# from https://github.com/lbeaucourt/Object-detection/blob/master/Dockerfile - line 11,12,27,28
# ------------------------------------------------------------------

    apt-get install -y libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev && \
    apt-get install -qqy x11-apps && \
    apt-get install -y ffmpeg && \
    pip install -U moviepy && \

# ==================================================================
# opencv
# ------------------------------------------------------------------
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        libatlas-base-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libprotobuf-dev \
        libsnappy-dev \
        protobuf-compiler \
        && \

    $GIT_CLONE --branch 3.4.1 https://github.com/opencv/opencv ~/opencv && \
    mkdir -p ~/opencv/build && cd ~/opencv/build && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
          -D CMAKE_INSTALL_PREFIX=/usr/local \
          -D WITH_IPP=OFF \
          -D WITH_CUDA=OFF \
          -D WITH_OPENCL=OFF \
          -D BUILD_TESTS=OFF \
          -D BUILD_PERF_TESTS=OFF \
          .. && \
    make -j"$(nproc)" install \
    && \


# ==================================================================
# config & cleanup
# ------------------------------------------------------------------

    ldconfig && \
    apt-get -y clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/*

# ==================================================================
# tensorboard : 6006 , jupyter notebook : 8888
# ------------------------------------------------------------------
# EXPOSE 8888
# EXPOSE 8888



# ==================================================================
# shared volume , -v $(pwd):/home/project
# ------------------------------------------------------------------
RUN mkdir -p /home/project
WORKDIR /home/project


# ==================================================================
# nvidia-docker hooks
# ------------------------------------------------------------------
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

