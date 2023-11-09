#!/bin/bash

# 컨테이너 실행
sudo podman run -dt --name calculation -it calc
sudo podman ps

# 현재 시간을 초로 변환
start_time=$(date +%s)

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
sudo podman container checkpoint --print-stats --pre-checkpoint calculation
sudo podman logs calculation

# 180초 후까지 대기
while true; do
    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))
    if [ "$elapsed_time" -ge 180 ]; then
        break
    fi
    sleep 1
done

# '복원용 체크포인트 생성' 명령어 실행
sudo podman logs calculation
sudo podman container checkpoint --with-previous calculation

sudo podman container restore calculation
sudo podman logs calculation

# 컨테이너 실행 중단
sudo podman stop calculation

# 실험 종료 후 컨테이너 삭제
#sudo podman rm calculation