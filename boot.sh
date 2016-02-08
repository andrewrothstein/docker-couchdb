#!/bin/sh

docker run -d -p 5985:5985 --name couchdb-lucene greenlizard/couchdb-lucene
docker run -d -p 5984:5984 --name couchdb --link couchdb-lucene:couchdb-lucene andrewrothstein/couchdb

