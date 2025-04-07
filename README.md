# Remote NVIDIA GPU Exporter

![Prometheus+Grafana Integration](https://img.shields.io/badge/Monitoring-Prometheus%20%2B%20Grafana-blue)
![Docker Support](https://img.shields.io/badge/Deploy-Docker-green)


Мониторинг GPU на хостах через SSH с интеграцией в Prometheus/Grafana.



## 📦 Особенности
- Сбор метрик NVIDIA GPU через SSH-туннель
- Сбор со всех хостов в одно место
- Оптимизированный вывод метрик
- Возможность масштабироваться с помощью Docker-Compose/Swarm и других оркестраторов контейнеров.

## 🛠 Требования
- Docker engine
- SSH-доступ до хоста с GPU (root) 
- `nvidia-smi` на целевом хосте (обычно в `/bin/nvidia-smi`)
- Если `nvidia-smi` находится по другому пути, отредактируйте файл `ssh_wrapper.sh`


## 📊 Визуализация
- Prometheus для сбора метрик
- Grafana для визуализации
- Официальная панель мониторинга NVIDIA GPU - [Grafana](https://grafana.com/grafana/dashboards/14574-nvidia-gpu-metrics/)
---

## 🐳 Docker deploy [image](https://hub.docker.com/repository/docker/k1haa/nvidia-gpu-exporter/general)
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
newgrp docker && docker version
docker pull k1haa/nvidia-gpu-exporter
docker run -d --name nvidia_exporter -p 9835:9835 -e HOST="" -e PASSWORD="" --restart always k1haa/nvidia-gpu-exporter