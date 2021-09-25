MAJOR=2
MINOR=0
PATCH=0 # *** !! UPDATE THIS AT A MINIMUM EACH TIME !! ***

docker image tag dev-container damienbarrett/dev-container:v$MAJOR
docker image tag dev-container damienbarrett/dev-container:v$MAJOR.$MINOR
docker image tag dev-container damienbarrett/dev-container:v$MAJOR.$MINOR.$PATCH
docker image tag dev-container damienbarrett/dev-container:latest

docker image push damienbarrett/dev-container:v$MAJOR
docker image push damienbarrett/dev-container:v$MAJOR.$MINOR
docker image push damienbarrett/dev-container:v$MAJOR.$MINOR.$PATCH
docker image push damienbarrett/dev-container:latest
