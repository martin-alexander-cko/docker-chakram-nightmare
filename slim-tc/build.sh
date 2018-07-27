VERSION=9.11-slim-tc
docker build -t vladimiraleksandrovcko/docker-chakram-nightmare:$VERSION .
docker push vladimiraleksandrovcko/docker-chakram-nightmare:$VERSION
