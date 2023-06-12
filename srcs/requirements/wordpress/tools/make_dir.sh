#!/bin/bash
if [ ! -d "/home/${USER}/data/wordpress" ]; then
        mkdir -p ~/data/mariadb
        mkdir -p ~/data/wordpress
fi