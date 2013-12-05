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
Vagrant example (assumes Virtualbox & Vagrant are installed)

1. `git clone https://github.com/ryersonlibrary/gsearch`
2. `cd fedora`
3. `bundle`
4. `berks`
5. `vagrant plugin install vagrant-berkshelf`
6. `vagrant plugin install vagrant-omnibus`
7. `vagrant up`
8. Enjoy your new instance at http://localhost:8080!

# License
[Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html)

# Author
Copyright © 2013 MJ Suhonos (<mjsuhonos@ryerson.ca>)

### Acknowledgements
Many thanks to Graham Stewart and others at the University of Toronto Libraries for [LibraryChef](https://github.com/LibraryChef).