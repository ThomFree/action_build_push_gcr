#!/bin/sh

set -e

echo "$INPUT_SERVICE_KEY" | base64 --decode > "$HOME"/gcloud.json

ENV_FLAG="--clear-env-vars"

gcloud auth activate-service-account --key-file="$HOME"/gcloud.json --project "$INPUT_PROJECT"
gcloud auth configure-docker

docker build --tag "$INPUT_IMAGE" .
docker push "$INPUT_IMAGE"