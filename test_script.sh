docker build -f Dockerfile.ci -t ${DOCKER_IMAGE_NAME} .
docker tag ${DOCKER_IMAGE_NAME} 192.168.143.128:5000/${DOCKER_IMAGE_NAME}:v1
docker push 192.168.143.128:5000/${DOCKER_IMAGE_NAME}:v1
cosign sign --yes --key hashivault://test-key 192.168.143.128:5000/${DOCKER_IMAGE_NAME}:v1
