log "\n=========== Start MapR validate_host.rb =============\n"

bash 'uname -m' do
  code <<-EOF
    uname -m`
  EOF
end

execute 'validate_host_viable' do
  command 'uname -m'
  action :run
end

sysctl_param 'vm.swappiness' do
  value 0
end

sysctl_param 'net.ipv4.tcp_retries2' do
  value 5
end

sysctl_param 'vm.overcommit_memory' do
  value 0
end

%( hard soft ).each do |ltype|
  set_limit 'mapr' do
    type ltype
    item 'nofile'
    value 64_000
  end

  set_limit 'mapr' do
    type ltype
    item 'nproc'
    value 64_000
  end
end

yum_repository 'maprtech' do
  description 'MapR Technologies'
  baseurl "http://package.mapr.com/releases/v#{node['mapr']['version']}/redhat"
  gpgcheck false
  action :create
end

yum_repository 'maprecosystem' do
  description 'MapR Technologies (ecosystem)'
  baseurl 'http://package.mapr.com/releases/ecosystem-4.x/redhat'
  gpgcheck false
  action :create
end
