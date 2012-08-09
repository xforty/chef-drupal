chef-drupal
===========
version 1.0.0 - [changelog](https://github.com/xforty/chef-drupal/blob/master/CHANGELOG.md)

### Description

Sets up an apache virtualhost and installs all the required software
for a drupal environment.

### Requirements

See [metadata.rb](https://github.com/xforty/chef-drupal/blob/master/metadata.rb)

### Attributes

#### default

See [attributes/default.rb](https://github.com/xforty/chef-drupal/blob/master/attributes/default.rb)
for default values.

* `default['drupal']['project_name']` - Name of the web app
* `default['drupal']['docroot']`      - Apache docroot for the site
* `default['drupal']['server_name']`  - URL used to access the site locally

### Usage

Simply include the drupal recipe and override any of the attributes 
as necessary.
