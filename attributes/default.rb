default['chef-server']['url'] = \
  'https://web-dl.packagecloud.io/chef/stable/packages/el/6/'\
  'chef-server-core-12.0.5-1.el6.x86_64.rpm'
default['chef-server']['checksum'] = \
  'ccdd4a9bf0a5eebec0f3e46785d3b86113debb44dbb3ab94677be49ba4798e26'
default['chef-server']['addons']['packages'] = \
  %w{opscode-manage opscode-reporting }
