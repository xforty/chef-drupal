#
# Author:: David King <dking@xforty.com>
# Contributor:: Christian Pearce <pearcec@xforty.com>
# Cookbook Name:: drupal
# Recipe:: default
#
# Copyright 2011, xforty technologies
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "drupal::server"
include_recipe "apache2"
include_recipe "apache2::mod_expires"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
include_recipe "mysql::server"
include_recipe "drush"

# Special setup for when Vagrantfile uses forwarded_ports
if defined? node['vagrant']['config']['keys']['vm']['forwarded_ports']

  # Using forwarded_ports always means "localhost" for server name
  node[:drupal][:server_name] = "localhost"

  # Solves the problem of HTTP request statuses failing with forwarded_ports
  # https://github.com/xforty/vagrant-drupal/issues/1
  include_recipe "drupal::iptables"
end

# Define virtualhost in apache for site
web_app node[:drupal][:project_name] do
  server_name node[:drupal][:server_name]
  server_aliases [node[:drupal][:server_name], 'local.vbox']
  docroot node[:drupal][:docroot]
end
