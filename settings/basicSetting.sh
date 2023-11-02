#!/bin/bash

# red hat 에서 podman 을 설치한다.
sudo dnf -y install podman

# container 이미지를 생성한다.
sudo podman build -t python -f Dockerfile-python .
sudo podman build -t notCM -f Dockerfile-notCM .

# 생성한 images 목록을 확인한다.
sudo podman images