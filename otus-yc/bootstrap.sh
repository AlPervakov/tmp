#!/bin/bash

apt update
apt install -fy python-pip build-essential python-dev

pip install flask psutil

wget https://raw.githubusercontent.com/AlPervakov/tmp/master/otus-yc/app.py -O app.py
FLASK_APP=app.py flask run --host=0.0.0.0 --port=80
