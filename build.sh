#!/bin/sh
docker pull klaemo/couchdb:latest
docker build -t andrewrothstein/couchdb:latest .
