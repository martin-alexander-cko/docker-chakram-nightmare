$version='9.11-slim-ci'
docker build -t vladimiraleksandrovcko/docker-chakram-nightmare:$version .
docker push vladimiraleksandrovcko/docker-chakram-nightmare:$version