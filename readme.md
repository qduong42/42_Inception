# Approach

1. 
- Build up Yaml files with pre-built image, to test the configuration
- Images will be built in the Dockerfile, docker-build makes image out of Dockerfile that we can use. docker-create makes container out of image.
	- Difference between dockerfile and docker-compose up/down. This is to orchestrate containers we have and make them work with each other. What they depend on, ports, volumes to access etc. This is done in yaml file. 
- This fragments the problemstellen, to make sure that yaml file and Makefile are running fine. Then containers make own images.

Comments:
- Maybe a down up approach is better: First configure Dockerfiles of images, then docker-compose to tie all of them in together. Or a combination of both.

## Clarifications
- MariaDB
