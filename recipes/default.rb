#
# Cookbook Name:: chef-server
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
package_url = node['chef-server']['url']
package_name = ::File.basename(package_url)
package_local_path = "#{Chef::Config[:file_cache_path]}/#{package_name}"

remote_file package_local_path do
  source package_url
  checksum 'ac6a8c45087cb28caf392c0dfdf93c40a763da585d8dd93473a87a36eca6f0aa'
end

rpm_package package_name do
  source package_local_path
  notifies :run, 'execute[chef-server-ctl reconfigure]', :immediately
end

node['chef-server']['addons']['packages'].each do |pkg|
  execute "chef-server-ctl install #{pkg}" do
    notifies :run, "execute[#{pkg}-ctl reconfigure]", :immediately
  end

  execute "#{pkg}-ctl reconfigure" do
    action :nothing
    notifies :run, 'execute[chef-server-ctl reconfigure]', :immediately
  end
end

execute 'chef-server-ctl reconfigure' do
  action :nothing
end
