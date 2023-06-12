#!/bin/bash
if [ ! -d "/home/${USER}/data/wordpress" ]; then
        mkdir ~/data
        mkdir ~/data/mariadb
        mkdir ~/data/wordpress
fi