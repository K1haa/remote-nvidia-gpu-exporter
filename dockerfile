FROM ubuntu:24.04

# Устанавливаем зависимости
RUN apt-get update && apt-get install -y \
    sshpass \
    openssh-client \
    curl \
    tar \
    && rm -rf /var/lib/apt/lists/*

# Скачиваем и распаковываем бинарник
RUN set -ex; \
    curl -LO https://github.com/utkuozdemir/nvidia_gpu_exporter/releases/download/v1.3.0/nvidia_gpu_exporter_1.3.0_linux_x86_64.tar.gz; \
    tar -xzf nvidia_gpu_exporter_1.3.0_linux_x86_64.tar.gz -C /usr/local/bin/; \
    rm nvidia_gpu_exporter_1.3.0_linux_x86_64.tar.gz; \
    chmod +x /usr/local/bin/nvidia_gpu_exporter

# Копируем скрипты
COPY scripts/ /opt/scripts/
COPY entrypoint.sh /

# Настройка прав
RUN chmod +x \
    /entrypoint.sh \
    /opt/scripts/ssh_wrapper.sh

# Healthcheck
HEALTHCHECK --interval=30s --timeout=5s \
    CMD curl -sf http://localhost:9835/metrics || exit 1

EXPOSE 9835
ENTRYPOINT ["/entrypoint.sh"]