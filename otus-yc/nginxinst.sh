#!/bin/bash

apt update
apt install -y nginx

systemctl nginx-reload
systemctl enable nginx.service 
systemctl start --no-block nginx.service
  
