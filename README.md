chef-drupal
===========

Sets up an apache virtualhost and installs all the required software
for a drupal environment.

### Requirements ###

* [Opscode's apache2 cookbook](http://community.opscode.com/cookbooks/apache2/)

### Attributes ###

#### default ####

* node[:drupal][:project_name] - fqdn of the site (you should override this)
* node[:drupal][:docroot]      - apache docroot for the site (not necessary to override)
* node[:drupal][:server_name]  - URL used to access the site locally (not necessary to override)

### USAGE ###

Simply include the drupal recipe and override any of the attributes 
as necessary.
