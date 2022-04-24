Development Container
=====================

Host Container
--------------

Ensure the following are installed on the HOST machine:
 - Docker Desktop
 - Visual Studio Code
    - Docker extension
    - Remote Containers extension 
 - Font
   - CaskaydiaCove Nerd Font



Docker Notes
------------

If changes are made to Dockerfile then the following steps should be taken:
1. Update Docker build.
2. Update tags and push to docker hub.

Update docker build.

    > ./docker-build.sh

Update tags and push to docker hub.

    > docker image tag dev-container damienbarrett/dev-container:v1
    > docker image push dev-container damienbarrett/dev-container:v1
   
    > docker image tag dev-container damienbarrett/dev-container:v1.0
    > docker image push dev-container damienbarrett/dev-container:v1.0
    
    > docker image tag dev-container damienbarrett/dev-container:v1.0.1
    > docker image tag dev-container damienbarrett/dev-container:v1.0.1
    
    > docker image push dev-container damienbarrett/dev-container:latest
    > docker image push damienbarrett/dev-container:latest


Per Project Notes
-----------------

### Yarn

 > yarn set version berry
 > yarn init -y

Quick Start Guide
-----------------

### macOS clean build

    git clone https://github.com/damienbarrett/dev-container.git

- Make changes to Dockerfile
- Update version in docker-push.sh and docker-push.ps1
- Test using docker-build.sh
- If successful then docker-push.x and git push

    

