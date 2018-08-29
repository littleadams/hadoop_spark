#!/bin/bash

sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp sources_tsinghua.list /etc/apt/sources.list

sudo cp ~/.bashrc ~/.bashrc.bak
sudo echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.bashrc
sudo echo "export HADOOP_HOME=/usr/local/hadoop" >> ~/.bashrc
sudo echo "export PATH=$PATH:$HADOOP_HOME/bin" >> ~/.bashrc
sudo echo "export PATH=$PATH:$HADOOP_HOME/sbin" >> ~/.bashrc
sudo echo "export HADOOP_MAPRED_HOME=$HADOOP_HOME" >> ~/.bashrc
sudo echo "export HADOOP_COMMON_HOME=$HADOOP_HOME" >> ~/.bashrc
sudo echo "export HADOOP_HDFS_HOME=$HADOOP_HOME" >> ~/.bashrc
sudo echo "export YARN_HOME=$HADOOP_HOME" >> ~/.bashrc
sudo echo "export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native" >> ~/.bashrc
sudo echo 'export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib"' >> ~/.bashrc
sudo echo "export JAVA_LIBRARY_PATH=$HADOOP_HOME/lib/native:$JAVA_LIBRARY_PATH" >> ~/.bashrc

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install default-jdk ssh rsync
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
