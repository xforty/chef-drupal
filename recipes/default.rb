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
include_recipe "php::module_gd"
include_recipe "php::module_mysql"
include_recipe "imagemagick"
include_recipe "apache2"
include_recipe "apache2::mod_expires"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
include_recipe "mysql::server"
include_recipe "drush"
include_recipe "drush::make"

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

# Run drush make if there is a distro.make file and docroot is empty
execute "run_distro_make" do
  cwd node[:drupal][:docroot]
  command "drush make #{node[:drupal][:make_options]} #{node[:drupal][:project_root]}/distro.make ."
  only_if do
    File.file?("#{node[:drupal][:project_root]}/distro.make") &&
        (Dir.entries(node[:drupal][:docroot]) - %w{ . .. }).empty?
  end
end
