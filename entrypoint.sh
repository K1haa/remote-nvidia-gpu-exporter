#!/bin/bash
set -e

exec nvidia_gpu_exporter \
    --web.listen-address=":9835" \
    --nvidia-smi-command="/opt/scripts/ssh_wrapper.sh" \
    --log.level="${LOG_LEVEL:-info}"