# NVIDIA GPU Exporter

![Prometheus+Grafana Integration](https://img.shields.io/badge/Monitoring-Prometheus%20%2B%20Grafana-blue)
![Docker Support](https://img.shields.io/badge/Deploy-Docker-green)


Мониторинг GPU на хостах через SSH с интеграцией в Prometheus/Grafana.

https://hub.docker.com/repository/docker/k1haa/nvidia-gpu-exporter/general

## 📦 Особенности
- Сбор метрик NVIDIA GPU через SSH-туннель
- Автоматический рестарт сервиса
- Поддержка современных версий Ubuntu/Debian
- Оптимизированный вывод метрик
- Можно масштабировать с помощью Docker-compose

## 🛠 Требования
- Ubuntu/Debian-хост для установки экспортера
- SSH-доступ к хосту с правами root
- `nvidia-smi` на целевом хосте (обычно в `/bin/nvidia-smi`)


## 📊 Визуализация
- Необходим Prometheus для сбора метрик
- Необходима Grafana для визуализации
- Вы можете использовать официальную панель мониторинга Grafana: https://grafana.com/grafana/dashboards/14574-nvidia-gpu-metrics/
---

## 🐳 Docker deploy
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
newgrp docker && docker version
docker pull k1haa/nvidia-gpu-exporter
docker run -d --name nvidia_exporter -p 9835:9835 -e HOST="" -e PASSWORD="" k1haa/nvidia-gpu-exporter