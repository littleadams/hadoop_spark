#!/bin/bash

sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp sources_tsinghua.list /etc/apt/sources.list

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install default-jdk ssh rsync rpm
ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa 
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys

sudo mkdir -p /usr/local/hadoop/hadoop_data/hdfs/namenode
sudo mkdir -p /usr/local/hadoop/hadoop_data/hdfs/datanode
sudo chown vagrant:vagrant -R /usr/local/hadoop

sudo cp -f conf_master/* /usr/local/hadoop/etc/hadoop/

wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
rpm -ivh mysql57-community-release-el7-9.noarch.rpm
apt-get install mysql-server mysql-connector-java 
systemctl enable mysqld 
