#!/usr/bin/env bash
cd /shared/httpd/
mkdir -p ./$STORENAME/htdocs
cd $STORENAME/htdocs
sudo -u www-data bash -c "git clone $GITREPO ."
sudo -u www-data bash -c "git checkout $GITBRANCH -f"
composer install
