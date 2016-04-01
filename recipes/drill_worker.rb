#
# Cookbook Name:: mapr_installation
# Recipe:: drill_worker
#
# Copyright (c) 2016 Synchronoss Technologies, Inc., All Rights Reserved.

mapr_homedir = node['mapr']['home']

%w( mapr-drill ).each do |pkg|
  package pkg do
    notifies :run, 'bash[configure for drill]'
  end
end

bash 'configure for drill' do
  action :nothing
  code <<-EOH
    #{mapr_homedir}/server/configure.sh -R
  EOH
  notifies :restart, 'service[mapr-warden]'
end
