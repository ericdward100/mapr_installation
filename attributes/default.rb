default['mapr']['users_data_bag'] = 'users'
default['mapr']['uid'] = 5000
default['mapr']['gid'] = 5000
default['mapr']['user'] = 'mapr'
default['mapr']['group'] = 'mapr'

default['mapr']['manage_java'] = true

# All MapR nodes in this cluster
default['mapr']['cluster_nodes'] = []

# Enter total number of nodes in MapR cluster here
default['mapr']['node_count'] = '3'

# Define MapR roles for configure.sh here
default['mapr']['cldb'] = []
default['mapr']['zk'] = []
default['mapr']['rm'] = []
default['mapr']['hs'] = 'ip-172-16-2-245.ec2.internal'
default['mapr']['ws'] = []

default['mapr']['home'] = '/opt/mapr'
default['mapr']['clustername'] = 'chef_test_cluster'
default['mapr']['version'] = '4.0.2'
default['mapr']['repo_url'] = 'http://package.mapr.com/releases'

default['mapr']['node']['disks'] = '/dev/xvdf,/dev/xvdg'

# default['java']['version'] = 'java-1.7.0-openjdk-devel-1.7.0.79-2.5.5.3.el6_6.x86_64'
# default['java']['home'] = '/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.79.x86_64/'

default['mapr']['yum']['gpgkey_url'] = 'http://package.mapr.com/releases/pub/maprgpg.key'
