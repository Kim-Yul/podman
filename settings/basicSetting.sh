#!/bin/bash

# red hat 에서 podman 을 설치한다.
if ! rpm -q podman &> /dev/null
then
    echo -e "\npodman이 설치되어 있지 않습니다. podman을 설치합니다."
    sudo dnf -y install podman
else
    echo -e "\npodman이 이미 설치되어 있습니다."
fi

# container 이미지를 생성한다.
echo -e "\n필요한 이미지를 생성합니다."
sudo podman build -t python -f Dockerfile-python . &> /dev/null
sudo podman build -t cm -f Dockerfile-cm . &> /dev/null
sudo podman build -t notcm -f Dockerfile-notCM . &> /dev/null
echo -e "필요한 이미지를 모두 생성했습니다."

# 생성한 images 목록을 확인한다.
echo -e "\n설치된 이미지 목록을 확인합니다."
sudo podman images