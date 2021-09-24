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