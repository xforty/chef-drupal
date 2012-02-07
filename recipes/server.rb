#
# Author:: Christian Pearce <pearcec@xforty.com>
# Cookbook Name:: drupal
# Recipe:: server
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
include_recipe "php_pear"
include_recipe "php_module::curl"
include_recipe "php_module::dom"
include_recipe "php_module::gd"
include_recipe "php_module::mbstring"
include_recipe "php_module::mysql"
include_recipe "php_module::uploadprogress"
include_recipe "imagemagick"
include_recipe "apache2"
include_recipe "apache2::mod_expires"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
