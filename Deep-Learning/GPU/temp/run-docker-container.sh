# xhost +local:root​

# nvidia-docker run -it --rm \
#   -p 8888:8888 \
#   -p 6006:6006 \
#   --env="DISPLAY" \
#   --env="QT_X11_NO_MITSHM=1" \
#   --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
#   -v $(pwd):/home/project \
#   --name tf14-py27-keras \
#   ksjdk/deeplearning:cu80-tf1.4-py27-keras \
#   bash

# xhost -local:root

# jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token= --notebook-dir='/home/project'
# for PyTorch --ipc=host



docker run -it --rm -d $(ls /dev/nvidia* | xargs -I{} echo '--device={}') $(ls /usr/lib/*-linux-gnu/{libcuda,libnvidia}* | xargs -I{} echo '-v {}:{}:ro') -p 8888:8888 -v $(pwd):/home/project  ksjdk/deeplearning:tf1.4-theano1.0-cntk2.4-py27-keras-gpu ipython3
