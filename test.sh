#!/bin/sh

#GET /
#GET /emails/_all_docs
#PUT /emails
#DELETE /emails
#DELETE /emails/_design/textindex
#PUT /emails/_design/textindex
#{
#    "fulltext": {
#	"by_subject": {
#	    "index": "function(doc) { var ret=new Document(); ret.add(doc.subject); return ret }"
#	},
#	"by_author": {
#	    "index": "function(doc) { var ret=new Document(); ret.add(doc.author); return ret }"
#	}
#    }
#}
#GET /emails/_design/textindex
#PUT /emails/5903f32c-4bab-11e5-a3e3-bfbb13059b9c
#{
#    "id" : "5903f32c-4bab-11e5-a3e3-bfbb13059b9c",
#    "author" : "Bob",
#    "subject" : "message from Bob"
#}
#DELETE /emails/5903f32c-4bab-11e5-a3e3-bfbb13059b9c
#PUT /emails/71983178-4bab-11e5-a3c6-8f2f2e982bdf
#{
#    "id" : "71983178-4bab-11e5-a3c6-8f2f2e982bdf",
#    "author" : "Sally",
#    "subject" : "message from Sally"
#}
#GET /emails/71983178-4bab-11e5-a3c6-8f2f2e982bdf
#GET _fti/local/emails/_design/textindex/by_author?q=Bob

COUCHDB_HOST=127.0.0.1
COUCHDB_PORT=5984
COUCHDB_URL=http://${COUCHDB_HOST}:${COUCHDB_PORT}

# create the emails database
curl -XPUT "$COUCHDB_URL/emails"

# setup the full text index
curl -XPUT "$COUCHDB_URL/emails/_design/textindex" -d'
{
   "fulltext": {
      "by_subject": {
         "index": "function(doc) { var ret=new Document(); ret.add(doc.subject); return ret }"
      },
      "by_author": {
         "index": "function(doc) { var ret=new Document(); ret.add(doc.author); return ret }"
      }
   }
}'

# insert two documents
curl -XPUT "$COUCHDB_URL/emails/5903f32c-4bab-11e5-a3e3-bfbb13059b9c" -d'
{
   "id": "5903f32c-4bab-11e5-a3e3-bfbb13059b9c",
   "author": "Bob",
   "subject": "message from Bob"
}'

curl -XPUT "$COUCHDB_URL/emails/71983178-4bab-11e5-a3c6-8f2f2e982bdf" -d'
{
   "id": "71983178-4bab-11e5-a3c6-8f2f2e982bdf",
   "author": "Sally",
   "subject": "message from Sally"
}'

# text search
curl -XGET "$COUCHDB_URL/_fti/local/emails/_design/textindex/by_author?q=Bob"
