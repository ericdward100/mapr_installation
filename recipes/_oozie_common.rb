#
# Cookbook Name:: mapr_installation
# Recipe:: oozie_client
#
# Copyright (c) 2016 Synchronoss Technologies, Inc., All Rights Reserved.

# For non-secure clusters,
# add the following two properties to the core-site.xml
#    (/opt/mapr/hadoop/hadoop-2.x.x/etc/hadoop/core-site.xml):

# <property>
#   <name>hadoop.proxyuser.mapr.hosts</name>
#   <value>*</value>
# </property>
# <property>
#   <name>hadoop.proxyuser.mapr.groups</name>
#   <value>*</value>
# </property>

oozie_port = 11_000
oozie_node = node['fqdn']

%w( mapr-oozie-internal mapr-oozie ).each do |pkg|
  package pkg do
    action :install
    notifies :create, 'template[core-site.xml]'
    notifies :restart, 'service[mapr-warden]'
  end
end

template '/etc/profile.d/oozie.sh' do
  source 'etc/profile.d/oozie.sh.erb'
  owner 'root'
  group 'root'
  mode 00555
  variables({
              oozie_node: oozie_node,
              oozie_port: oozie_port
            })
end

# i know, I know, node.set is bad.  But i need these to persist.
node.set['mapr']['coresite_xml']['hadoop.proxyuser.mapr.hosts'] = '*'
node.set['mapr']['coresite_xml']['hadoop.proxyuser.mapr.groups'] = '*'
