FROM andrewrothstein/docker-ansible-onbuild:ubuntu_trusty
EXPOSE 5984
VOLUMES ['/usr/local/var/lib/couchdb', '/usr/local/var/log/couchdb']
CMD /usr/local/bin/couchdb
