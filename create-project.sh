#!/usr/bin/env bash

cd /shared/httpd/
sudo mkdir -p $STORENAME/htdocs
cd $STORENAME/htdocs
sudo bash -c "git clone $GITREPO ."
sudo bash -c "composer install"
sudo bash -c "chown -R devilbox:devilbox ../htdocs/$STORANAME"
