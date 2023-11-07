#!/bin/bash

# 컨테이너 실행
sudo podman run -dt --name calculation -it calc
sudo podman ps

# 현재 시간을 초로 변환
start_time=$(date +%s)

# 컨테이너 내의 로그 확인
sudo podman logs calculation

# 60초 후까지 대기
while true; do
    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))
    if [ "$elapsed_time" -ge 60 ]; then
        break
    else
        sudo podman logs calculation
    fi
    sleep 1
done

# 'checkpoint' 명령어 실행
sudo podman container checkpoint --pre-checkpoint calculation

# 컨테이너 내의 로그 확인
sudo podman logs calculation
sudo podman ps

# 120초 후까지 대기
while true; do
    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))
    if [ "$elapsed_time" -ge 120 ]; then
        break
    else
        sudo podman logs calculation
    fi
    sleep 1
done

# 실험 종료 후 컨테이너 삭제
sudo podman rm changedMemory