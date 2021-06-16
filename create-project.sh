#!/usr/bin/env bash
cd /shared/httpd/
mkdir $STORENAME
cd $STORENAME
sudo -u www-data bash -c "git clone $GITREPO htdocs/"
sudo -u www-data bash -c "git checkout $GITBRANCH -f"
sudo -H -u www-data bash -c "composer install"
