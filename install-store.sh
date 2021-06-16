#!/usr/bin/env bash

# Getting minimun information to install
echo -n "Store name (ex: lojaexemplo): "
read STORENAME

echo -n "Store domain (ex: lojaexemplo.local): "
read STOREURL

echo -n "Store git repository (ex: git@gitlab.com:bis2bis/m2/back/lojas/ibyte.git): "
read GITREPO

echo -n "DB name: "
read DBNAME

echo -n "DB password: "
read DBPSWD

export STORENAME
export STOREURL
export DBPSWD
export DBNAME

bash ./create-project.sh
bash ./store-config.sh