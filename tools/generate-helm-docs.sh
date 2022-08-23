#!/usr/bin/env bash
set -o errexit
set -o nounset

# Generate helm-docs for Helm charts

# require docker
command -v docker >/dev/null 2>&1 || {
  echo >&2 "Docker is not installed. Aborting."
  exit 1
}

# Absolute path of repository
repository=$(git rev-parse --show-toplevel)

docker pull jnorwood/helm-docs:latest

for train in charts
do
  for chart in ${train}/*; do
    if [ -d "${chart}" ]; then
      chartname=$(basename ${chart})
      chartversion=$(cat ${chart}/Chart.yaml | grep "^version: " | awk -F" " '{ print $2 }')

      docker container run \
        --rm \
        --volume "$(pwd):/helm-docs" \
        --user $(id -u) \
        jnorwood/helm-docs:latest \
        helm-docs \
        --ignore-file=".helmdocsignore" \
        --output-file="README.md" \
        --chart-search-root="${chart}"
    fi
  done
done
