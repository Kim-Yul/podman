#!/bin/bash

# 기존에 존재하는 images 목록을 전부 삭제한다.
echo -e "\n존재하는 모든 이미지를 삭제합니다."
sudo podman rm -a
sudo podman rmi -a

# container 이미지를 생성한다.
echo -e "\ncheckpoint-time 실험에 필요한 이미지를 생성합니다."
sudo podman build -t python -f Dockerfile-python . &> /dev/null
sudo podman pull docker.io/tensorflow/tensorflow:latest &> /dev/null
sudo podman build -t dump -f Dockerfile-dump . &> /dev/null
echo -e "필요한 이미지를 모두 생성했습니다."

# 생성한 images 목록을 확인한다.
echo -e "\n설치된 이미지 목록을 확인합니다."
sudo podman images