#!/bin/bash

sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp sources_tsinghua.list /etc/apt/sources.list

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install default-jdk ssh rsync
ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa 

sudo mkdir -p /usr/local/hadoop/hadoop_data/hdfs/namenode
sudo mkdir -p /usr/local/hadoop/hadoop_data/hdfs/datanode
sudo chown vagrant:vagrant -R /usr/local/hadoop

sudo cp -f conf_node/* /usr/local/hadoop/etc/hadoop/
