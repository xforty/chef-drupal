#
# Author:: David King <dking@xforty.com>
# Contributor:: Christian Pearce <pearcec@xforty.com>
# Cookbook Name:: drupal
# Recipe:: iptables
#
# Copyright 2011-2012, xforty technologies
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
  
include_recipe "iptables"

# Define a iptables.snat file so rebuild-iptables uses it
template "/etc/iptables.snat" do
  source "iptables.snat.erb"
  mode 0440
  owner "root"
  group "root"
  variables :forwarded_ports => node['vagrant']['config']['keys']['vm']['forwarded_ports']
end

# Basic rule to kick off rebuild-iptables 
iptables_rule "all_established"

# Flush iptables for distros that need it
case node["platform"]
when "centos", "redhat", "fedora"
  execute "flush_iptables" do
    command "/sbin/iptables -F"
  end
  execute "flush_iptables_nat" do
    command "/sbin/iptables -F -t nat"
  end
end
