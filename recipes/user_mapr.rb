log "\n=========== Start MapR user_mapr.rb =============\n"

data_bag   = node['mapr']['users_data_bag']
mapr_group = node['mapr']['group']
mapr_gid   = node['mapr']['gid']

users_manage mapr_group do
  group_id mapr_gid
  action [:create]
  data_bag data_bag
  manage_nfs_home_dirs false
  not_if { data_bag.nil? }
end

sudo 'mapr' do
  user 'mapr'
  runas 'ALL'
  nopasswd true
end
