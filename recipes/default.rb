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
  checksum 'cb726462fc991fe2ee044b3f58bad24de3e5d210a1705985e85e9a591d68c6f6'
end

rpm_package package_name do
  source package_local_path
  notifies :run, 'execute[chef-server-ctl reconfigure]', :immediately
end

node['chef-server']['addons']['packages'].each do |pkg|
  execute "chef-server-ctl install #{pkg}"

  execute "#{pkg}-ctl reconfigure" do
    notifies :run, 'execute[chef-server-ctl reconfigure]', :immediately
  end
end

execute 'chef-server-ctl reconfigure' do
  action :nothing
end
