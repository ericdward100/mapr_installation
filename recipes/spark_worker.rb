#
# Cookbook Name:: spark_worker
# Recipe:: spark
#
# Copyright (c) 2016 Synchronoss Technologies, Inc., All Rights Reserved.

# create a spark master node, with spark history server

mapr_homedir  = node['mapr']['home']

spark_homedir = "#{mapr_homedir}/spark/spark-current"

%w( mapr-spark).each do |pkg|
  package pkg
end

bash "create symlink for #{spark_homedir}" do
  code <<-EOH
    ln -s #{mapr_homedir}/spark/spark-* #{spark_homedir}
  EOH
  not_if "test -r #{spark_homedir}"
end
