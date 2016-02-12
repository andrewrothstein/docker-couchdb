FROM andrewrothstein/docker-ansible-onbuild:ubuntu_trusty
EXPOSE 5984
CMD /usr/local/bin/couchdb
