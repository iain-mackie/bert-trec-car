# build docker
DOCKER_PATH="./Dockerfile_run_eval"

echo "Trying to build docker image from:" $DOCKER_PATH;

if [ -f "$DOCKER_PATH" ]; then
  echo "file exits"
  sudo docker build -t iainmackie/bert-trec-car-run-eval -f $DOCKER_PATH .
  # sudo docker run -it iainmackie/bert-trec-car

else
  echo "Error - path to file not found:" $DOCKER_PATH;
  exit 0;

fi