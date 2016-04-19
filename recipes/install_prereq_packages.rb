include_recipe 'build-essential'

log "\n=========== Start MapR install_mapr_prereqs.rb =============\n"

package 'bash'
package 'rpcbind'
package 'dmidecode'
package 'hdparm'
package 'initscripts'
package 'iputils'
package 'irqbalance'
package 'redhat-lsb-core'
package 'rpm-libs'
package 'sdparm'
package 'shadow-utils'
package 'syslinux'
package 'unzip'
package 'zip'
package 'nc'
package 'wget'
package 'git'
package 'nfs-utils'
package 'nfs-utils-lib'
package 'git'
package 'patch'
package 'dstat'
package 'lsof'

include_recipe 'java' if node['mapr']['manage_java']

# java_version = node['java']['version']

# bash 'Install_java' do
#   code <<-EOH
#     yum -y install #{java_version}
#   EOH
# end

# # Add JAVA_HOME to /etc/profile
# ruby_block 'Set JAVA_HOME in /etc/profile' do
#   block do
#     file = Chef::Util::FileEdit.new('/etc/profile')
#     file.insert_line_if_no_match("export JAVA_HOME=#{node['java']['home']}",
#                                  "\nexport JAVA_HOME=#{node['java']['home']}")
#     file.insert_line_if_no_match('export EDITOR=vi', 'export EDITOR=vi')

#     file.write_file
#   end
# end

service 'rpcbind' do
  action [:enable, :start]
end
