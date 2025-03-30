#!/bin/bash
sshpass -p "${PASSWORD}" ssh -o StrictHostKeyChecking=no root@${HOST} \
"/bin/nvidia-smi $@" 2>/dev/nul