Development Container
=====================

Ensure the following are installed on the HOST machine:
 - Docker Desktop
 - Visual Studio Code
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

