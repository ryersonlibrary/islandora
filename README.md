# Description

This cookbook will install and configure [Islandora](http://islandora.ca).

Included [Vagrant](http://www.vagrantup.com) and [Berkshelf](http://berkshelf.com) files for easy VM creation

# Requirements

## Platform

Tested on Ubuntu 12.04 (precise)

## Cookbooks
* git
* [djatoka](http://github.com/ryersonlibrary/djatoka)
* [fedora](http://github.com/ryersonlibrary/fedora)
* [solr](http://github.com/ryersonlibrary/solr)
* [gsearch](http://github.com/ryersonlibrary/gsearch)
* [drupal](http://github.com/gondoi/drupal-cookbook)

# Attributes
__TODO__

# Usage
# Recipes
Include the 'default' recipe to install Islandora on your system.

	include_recipe "islandora::default"

# License
[Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html)

# Author
Copyright © 2013 MJ Suhonos (<mjsuhonos@ryerson.ca>)

# Acknowledgements
Many thanks to Graham Stewart and others at the University of Toronto Libraries for [LibraryChef](https://github.com/LibraryChef).