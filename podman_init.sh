#!/bin/bash

# red hat 에서 podman 을 설치한다.
if ! rpm -q podman &> /dev/null
then
    echo -e "\npodman이 설치되어 있지 않습니다. podman을 설치합니다.\n"
    sudo dnf -y install podman
else
    echo -e "\npodman이 이미 설치되어 있습니다."
fi