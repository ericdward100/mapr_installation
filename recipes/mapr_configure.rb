log "\n=========== Start MapR mapr_configure.rb =============\n"

# Make sane list of appropriate nodes...might be a better way to do this...
cldb_nodes = node['mapr']['cldb'].reject(&:empty?).join(',')
zk_nodes = node['mapr']['zk'].reject(&:empty?).join(',')
rm_nodes = node['mapr']['rm'].reject(&:empty?).join(',')

# Run configure.sh to configure the nodes, do NOT bring the cluster up

bash 'Run configure.sh to configure cluster' do
  code <<-EOH

  #{node['mapr']['home']}/server/configure.sh \
           -C #{cldb_nodes} \
           -Z #{zk_nodes} \
           -RM #{rm_nodes} \
           -HS #{node['mapr']['hs']} \
           -D #{node['mapr']['node']['disks']} \
           -N #{node['mapr']['clustername']} \
           -no-autostart
  EOH
  not_if { ::File.exist?("#{node['mapr']['home']}/conf/disktab") }
  # action :run
end
