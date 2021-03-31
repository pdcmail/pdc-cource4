#!/bin/bash
# Provision machine file
# 31.03.2021

# install packages

if ! dpkg --list  | grep -Po "git"; then
    sudo apt-get update && apt-get install git
fi

if ! dpkg --list  | grep -oP "python3\..*"; then
    sudo apt update && sudo apt -y upgrade
    sudo apt install software-properties-common
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt install -y python3.9
fi

cd /tmp
git clone -b python_app  https://github.com/pdcmail/pdc-cource4.git
