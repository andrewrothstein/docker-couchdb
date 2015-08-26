#!/bin/sh

docker run -d -p 5984:5984 --name couchdb andrewrothstein/couchdb
docker run -d -p 5985:5985 --name couchdb-lucene greenlizard/couchdb-lucene
