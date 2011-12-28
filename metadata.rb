maintainer       "xforty technologies"
maintainer_email "dking@xforty.com"
license          "Apache 2.0"
description      "Installs/Configures drupal"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"

# default recipe
depends          "php"
depends          "imagemagick"
depends          "apache2"
depends          "mysql"
depends          "drush"

# dev recipe
depends          "git"
