default['chef-server']['url'] = \
  'https://web-dl.packagecloud.io/chef/stable/packages/el/6/'\
  'chef-server-core-12.0.7-1.el6.x86_64.rpm'
default['chef-server']['checksum'] = \
  'f7a21b392f410d7485dff4b5a06ee2da92807a4875b51568f4a960a1aa6a0f83'
default['chef-server']['addons']['packages'] = \
  %w{opscode-manage opscode-reporting }
