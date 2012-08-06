chef-drupal
===========

Sets up an apache virtualhost and installs all the required software
for a drupal environment.

### Requirements ###

* See [metadata.rb](https://github.com/xforty/chef-drupal/blob/master/metadata.rb)

### Attributes ###

#### default ####

* `node['drupal']['project_name']` - Name of the web app (default: VM's host name)
* `node['drupal']['docroot']`      - Apache docroot for the site
* `node['drupal']['server_name']`  - URL used to access the site locally (default: project_name with ".local" appended)

### USAGE ###

Simply include the drupal recipe and override any of the attributes 
as necessary.
