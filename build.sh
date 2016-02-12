#!/bin/sh
docker pull andrewrothstein/docker-ansible-onbuild:ubuntu_trusty
docker build -t andrewrothstein/couchdb:latest .
