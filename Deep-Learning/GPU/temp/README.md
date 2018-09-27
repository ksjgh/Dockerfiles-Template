## Pull pre-built image
docker pull ksjdk/deep-learning

## To build docker image
edit 'docker-build.sh'</br>
run  './docker-build.sh'

## To run container
edit 'run-docker-container.sh' </br>
run  './run-docker-container.sh' 

## To use jupyter notebook
run in the container</br> 
> jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token= --notebook-dir='/home/project'<br>

## Note
* Based on ufoym/deepo 'https://github.com/ufoym/deepo'
* for PyTorch : --ipc=host

