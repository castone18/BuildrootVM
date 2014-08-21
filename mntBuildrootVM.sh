#!/bin/bash

sudo mkdir -p /media/BuildrootVM
sudo mount -t cifs -o username=tc,password=vagrant,uid=`id -u`,gid=`id -g` //10.1.0.1/tc /media/BuildrootVM
