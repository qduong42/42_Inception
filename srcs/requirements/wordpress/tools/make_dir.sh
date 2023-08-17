#!/bin/bash
if [ ! -d "${PWD}/data/wordpress" ]; then
        mkdir -p ${PWD}/data/mariadb
        mkdir -p ${PWD}/data/wordpress
fi