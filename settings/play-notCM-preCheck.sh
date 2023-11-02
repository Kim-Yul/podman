#!/bin/bash

# 컨테이너 실행
sudo podman run -d --name notChangedMemory notCM

# 현재 시간을 초로 변환
start_time=$(date +%s)

# 30초 후까지 대기
while true; do
    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))
    if [ "$elapsed_time" -ge 30 ]; then
        break
    fi
    sleep 1
done

# 'pre-checkpoint' 명령어 실행
sudo podman container checkpoint --pre-checkpoint notChangedMemory

# 60초 후까지 대기
while true; do
    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))
    if [ "$elapsed_time" -ge 60 ]; then
        break
    fi
    sleep 1
done

# 'pre-checkpoint' 명령어 실행
sudo podman container checkpoint --pre-checkpoint notChangedMemory