docker build -f Dockerfile.ci -t ${DOCKER_IMAGE_NAME} .
docker tag ${DOCKER_IMAGE_NAME}:latest 192.168.143.128:5000/${DOCKER_IMAGE_NAME}:latest
cmd_output=$(docker push 192.168.143.128:5000/${DOCKER_IMAGE_NAME}:latest)
echo ${cmd_output}
digest=$(echo "$cmd_output" | sed -n 's/.*digest: \(sha256:[a-f0-9]\{64\}\).*/\1/p')
echo ${digest}
cosign sign --yes --key hashivault://test-key 192.168.143.128:5000/${DOCKER_IMAGE_NAME}@${digest}
