#!/bin/bash
~/miniconda3/bin/conda init bash
. /root/.bashrc
cd /home/ubuntu/minerva-author/src
/root/miniconda3/bin/python -m gunicorn --bind 127.0.0.1:8000 --workers=1 --threads=15 app:app
# /root/miniconda3/bin/python ./src/app.py