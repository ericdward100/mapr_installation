#
# Cookbook Name:: mapr_installation
# Recipe:: _spark_common
#
# Copyright (c) 2016 Synchronoss Technologies, Inc., All Rights Reserved.

# some common _spark tasks

mapr_homedir  = node['mapr']['home']

spark_homedir = "#{mapr_homedir}/spark/spark-current"

%w( mapr-spark ).each do |pkg|
  package pkg do
  end
end

bash "create symlink for #{spark_homedir}" do
  code <<-EOH
    ln -s #{mapr_homedir}/spark/spark-* #{spark_homedir}
  EOH
  not_if "test -r #{spark_homedir}"
end

spark_path = "#{spark_homedir}/bin"

dashed_ip = node['cloud']['public_ipv4'].gsub(/\./, '-')
spark_public_dns = "ec2-#{dashed_ip}.compute-1.amazonaws.com"

template '/etc/profile.d/spark.sh' do
  source 'etc/profile.d/spark.sh.erb'
  owner 'root'
  group 'root'
  mode 00555
  variables({
              spark_path: spark_path,
              spark_public_dns: spark_public_dns
            })
end
