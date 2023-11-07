#!/bin/bash

# 컨테이너 실행
sudo podman run -dt --name changedMemory -it cm
sudo podman ps

# 현재 시간을 초로 변환
start_time=$(date +%s)

# 120초 후까지 대기
while true; do
    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))
    if [ "$elapsed_time" -ge 120 ]; then
        break
    fi
    sleep 1
done

# 'checkpoint' 명령어 실행
sudo podman container checkpoint --print-stats changedMemory

# 실험 종료 후 컨테이너 삭제
sudo podman rm changedMemory