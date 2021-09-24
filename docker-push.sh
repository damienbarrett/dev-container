MAJOR=1
MINOR=0
PATCH=2 # *** !! UPDATE THIS AT A MINIMUM EACH TIME !! ***

docker image tag dev-container damienbarrett/dev-container:v$MAJOR
docker image tag dev-container damienbarrett/dev-container:v$MAJOR.$MINOR
docker image tag dev-container damienbarrett/dev-container:v$MAJOR.$MINOR.$PATCH

docker image push damienbarrett/dev-container:v$MAJOR
docker image push damienbarrett/dev-container:v$MAJOR.$MINOR
docker image push damienbarrett/dev-container:v$MAJOR.$MINOR.$PATCH
docker image push damienbarrett/dev-container:latest
