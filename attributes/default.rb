default[:mapr][:uid] = 5000
default[:mapr][:gid] = 5000
default[:mapr][:user] = 'mapr'
default[:mapr][:group] = 'mapr'
default[:mapr][:password] = '$1$x4GGdWjX$5IZsb6wdcgGjzdSKK6yd6/'
default[:root][:password] = '$1$PvTToSKD$CDPWULL69FK00rQy7R6Rt.'
default[:ntp][:servers] = ['0.pool.ntp.org', '1.pool.ntp.org']

# All MapR nodes in this cluster
default[:mapr][:cluster_nodes] = [
  'ip-172-16-2-80.ec2.internal',
  'ip-172-16-2-227.ec2.internal',
  'ip-172-16-2-245.ec2.internal'
]

# Enter total number of nodes in MapR cluster here
default[:mapr][:node_count] = '3'

# Define MapR roles for configure.sh here
default[:mapr][:cldb] = ['ip-172-16-2-80.ec2.internal', 'ip-172-16-2-227.ec2.internal']
default[:mapr][:zk] = ['ip-172-16-2-80.ec2.internal', 'ip-172-16-2-227.ec2.internal', 'ip-172-16-2-245.ec2.internal']
default[:mapr][:rm] = ['ip-172-16-2-227.ec2.internal', 'ip-172-16-2-245.ec2.internal']
default[:mapr][:hs] = 'ip-172-16-2-245.ec2.internal'
default[:mapr][:ws] = ['ip-172-16-2-80.ec2.internal', 'ip-172-16-2-227.ec2.internal']

default[:se_status] = 'Disabled'

default[:mapr][:node][:host] = 'nodeX'
default[:mapr][:node][:fqdn] = 'nodeX.cluster.com'
default[:mapr][:node][:ip] = '1.1.1.1'

default[:mapr][:home] = '/opt/mapr'
default[:mapr][:clustername] = 'chef_test_cluster'
default[:mapr][:version] = '4.0.2'
default[:mapr][:repo_url] = 'http://package.mapr.com/releases'

default[:mapr][:node][:disks] = '/dev/xvdf,/dev/xvdg'

default[:java][:version] = 'java-1.7.0-openjdk-devel-1.7.0.79-2.5.5.3.el6_6.x86_64'
default[:java][:home] = '/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.79.x86_64/'
