log "\n=========== Start MapR user_mapr.rb =============\n"

group node['mapr']['group'] do
  gid node['mapr']['gid']
end

user node['mapr']['user'] do
  uid node['mapr']['uid']
  gid node['mapr']['gid']
  shell '/bin/bash'
  home "/home/#{node['mapr']['user']}"
end

user 'setting mapr password' do
  username node['mapr']['user']
  password node['mapr']['password']
  action :modify
end

directory "/home/#{node['mapr']['user']}" do
  owner node['mapr']['user']
  group node['mapr']['group']
  mode 0700
end

sudo 'mapr' do
  user 'mapr'
  runas 'ALL'
  nopasswd true
end
