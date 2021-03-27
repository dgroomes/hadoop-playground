#!/usr/bin/env bash
# Build a Docker image with Hadoop

if [[ ! -d tmp/hadoop ]]; then
  echo >&2 "'tmp/hadoop' does not exist. You must download Hadoop manually and place it under 'tmp/'. See the README for instructions."
  exit 1
fi

DOCKER_BUILDKIT=1 docker build -t hadoop-playground .
