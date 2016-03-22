name             'mapr_installation'
maintainer       'Eric'
maintainer_email ''
license          'All rights reserved'
description      'Installs/Configures mapr_installation'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.0'

%w( build-essential iptables java limits ntp
    sysctl selinux sudo users yum ).each do |cb|
  depends cb
end

%w( centos redhat ).each do |os|
  supports os
end
