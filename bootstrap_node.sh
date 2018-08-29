
## hadoop 
tar xzf /vagrant/files/hadoop-2.8.1.tar.gz
mv hadoop-2.8.1 /usr/local/hadoop
cp /vagrant/conf_node/hadoop/* /usr/local/hadoop/etc/hadoop

# set hosts
echo '10.211.55.100 master' >> /etc/hosts
echo '10.211.55.101 node1' >> /etc/hosts
echo '10.211.55.102 node2' >> /etc/hosts
