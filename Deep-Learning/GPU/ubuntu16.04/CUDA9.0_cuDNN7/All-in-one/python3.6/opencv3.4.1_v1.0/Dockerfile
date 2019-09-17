# ==================================================================
# module list
# ------------------------------------------------------------------
# python        3.6    (apt)
# torch         latest (git)
# chainer       latest (pip)
# cntk          latest (pip)
# jupyter       latest (pip)
# mxnet         latest (pip)
# onnx          latest (pip)
# pytorch       0.4.1  (pip)
# tensorflow    latest (pip)
# theano        1.0.1  (git)
# keras         latest (pip)
# lasagne       latest (git)
# opencv        3.4.1  (git)
# sonnet        latest (pip)
# caffe         latest (git)
# caffe2        latest (git)
# ==================================================================

FROM ufoym/deepo


RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
    PIP_INSTALL="python -m pip --no-cache-dir install --upgrade" && \
    GIT_CLONE="git clone --depth 10" && \

    rm -rf /var/lib/apt/lists/* \
           /etc/apt/sources.list.d/cuda.list \
           /etc/apt/sources.list.d/nvidia-ml.list && \

    apt-get update && \


# ==================================================================
# jupyter
# ------------------------------------------------------------------

    $PIP_INSTALL \
        jupyter
# ==================================================================



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

