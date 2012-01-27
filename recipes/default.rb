#
# Author:: David King <dking@xforty.com>
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

include_recipe "php"
include_recipe "pear"
include_recipe "php_curl"
include_recipe "php_gd"
include_recipe "php_mysql"
include_recipe "php_xml"
include_recipe "imagemagick"
include_recipe "apache2"
include_recipe "apache2::mod_expires"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
include_recipe "mysql::server"
include_recipe "drush"
include_recipe "iptables"

# Provides better feedback during file uploads
php_pear "uploadprogress" do
  action :install
end

# Define virtualhost in apache for site
web_app node[:drupal][:project_name] do
  server_name node[:drupal][:server_name]
  server_aliases [node[:drupal][:server_name], 'local.vbox']
  docroot node[:drupal][:docroot]
end

unless node[:vagrant][:config][:keys][:vm][:network]
  # Define a iptables.snat file so rebuild-iptables uses it
  template "/etc/iptables.snat" do
    source "iptables.snat.erb"
    mode 0440
    owner "root"
    group "root"
    variables :forwarded_ports => node[:vagrant][:config][:keys][:vm][:forwarded_ports]
  end

  # Basic rule to kick off rebuild-iptables 
  iptables_rule "all_established"
end

