#!/usr/bin/env bash

# Getting minimun information to install
echo -n "Store name (ex: lojaexemplo): "
read STORENAME

echo -n "Store git repository (ex: git@gitlab.com:bis2bis/m2/back/lojas/ibyte.git): "
read GITREPO

echo -n "DB name: "
read DBNAME

echo -n "DB user: "
read DBUSER

echo -n "DB password: "
read DBPSWD

echo "$DBPSWD"

export STORENAME
export DBPSWD
export DBNAME
export DBUSER
export GITREPO

bash /shared/httpd/install-magento-local/create-project.sh
bash /shared/httpd/install-magento-local/store-config.sh