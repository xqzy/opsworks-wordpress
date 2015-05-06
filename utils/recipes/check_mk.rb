### instalar xinetd
package "xinetd" do
  action :install
end

### instalar paquetes check_mk
remote_file "/tmp/check-mk-agent_1.2.4p5-2_all.deb" do
  source "http://mathias-kettner.de/download/check-mk-agent_1.2.4p5-2_all.deb"
  mode 0644
  checksum "d814f1793de9215cc5a0a9b679b6e6fe4c7014268638c6523ce8079b3801ba8c" # PUT THE SHA256 CHECKSUM HERE
end

dpkg_package "check-mk-agent" do
  source "/tmp/check-mk-agent_1.2.4p5-2_all.deb"
  action :install
end

remote_file "/tmp/check-mk-agent-logwatch_1.2.4p5-2_all.deb" do
  source "http://mathias-kettner.de/download/check-mk-agent-logwatch_1.2.4p5-2_all.deb"
  mode 0644
  checksum "3b79fc84bd8013e069a6868d07491973ae1944dd1bc0deda2dfb7d34f639274d" # PUT THE SHA256 CHECKSUM HERE
end

dpkg_package "check-mk-agent-logwatch" do
  source "/tmp/check-mk-agent_1.2.4p5-2_all.deb"
  action :install
end

# check_mk directory
directory "/etc/check_mk" do
  owner 'root'
  group 'root'
  mode '0644'
  recursive true
end

# logwatch fichero
template "/etc/check_mk/logwatch.cfg" do
  source "logwatch.cfg.erb"
  mode '0640'
  owner 'root'
  group 'root'
end

# fileinfo fichero

template "/etc/check_mk/fileinfo.cfg" do
  source "fileinfo.cfg.erb"
  mode '0640'
  owner 'root'
  group 'root'
end

# config mrpe
template "/etc/check_mk/mrpe.cfg" do
  source "mrpe.cfg.erb"
  mode '0640'
  owner 'root'
  group 'root'
end

# config check_mk in xinetd
template "/etc/xinetd.d/check_mk" do
  source "xinetd.erb"
  mode '0640'
  owner 'root'
  group 'root'
end

# plugins directorio
directory "/usr/lib/check_mk_agent/plugins" do
  owner 'root'
  group 'root'
  mode '0644'
  recursive true
end

# apache plugin
template "/usr/lib/check_mk_agent/plugins/apache_status" do
  source "apache_status.erb"
  mode '0640'
  owner 'root'
  group 'root'
end

# smart plugin
template "/usr/lib/check_mk_agent/plugins/smart" do
  source "smart.erb"
  mode '0640'
  owner 'root'
  group 'root'
end

# lmsensors plugin
template "/usr/lib/check_mk_agent/plugins/lmsensors" do
  source "lmsensors.erb"
  mode '0640'
  owner 'root'
  group 'root'
end