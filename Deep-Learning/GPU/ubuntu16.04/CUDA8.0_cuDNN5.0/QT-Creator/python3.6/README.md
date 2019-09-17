<<<<<<< HEAD
## Pull pre-built image
docker pull ksjdk/deep-learning
=======
# Usage
---
## pull pre-built image
```
docker pull ksjdk/deep-learning:pytorch04-cu80-py36-gpu
```
>>>>>>> master

## To build docker image
* Edit image filename to be built
```gedit docker-build.sh```

* Build image
```sudo ./docker-build.sh```

## To run container
* Edit container name 
```gedit run-docker-container.sh```
* Run container (GUI is supported by nvidia-docker)
```sudo ./run-docker-container.sh```

## To use jupyter notebook
<<<<<<< HEAD
run in the container</br> 
> jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token= --notebook-dir='/home/project'<br>

## Note
* Based on ufoym/deepo 'https://github.com/ufoym/deepo'
=======
* Run command in the container
```jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token= --notebook-dir='/home/project```
* On host machine(outside docker container) , open web-brower and type URL
```localhost:8888```
* Notebook is connected and input key shown in the docker container
---
# Note
>>>>>>> master
* for PyTorch : --ipc=host

