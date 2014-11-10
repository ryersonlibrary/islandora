# Islandora Chef

## Description

This cookbook will install and configure [Islandora](http://islandora.ca). Current version is 7.1.4.

Included [Vagrant](http://www.vagrantup.com) and [Berkshelf](http://berkshelf.com) files for easy VM creation

## Requirements

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](http://localhost:8181) 1.5.2+
* vagrant-berkshelf 2.0.1

## Platform

* Ubuntu 12.04
* Fedora 3.7.0
* GSearch 2.6.2
* Solr 4.2.0
* Drupal 7.33
* PHP 5.3.10
* Java 7 (Oracle)
* Djatoka 1.1

## Cookbooks

* [drupal](http://github.com/gondoi/drupal-cookbook)
* ubuntu-baseline
* djatoka
* fedora
* solr
* gsearch

## Attributes
__TODO__

## Usage

1. `git clone https://github.com/ryersonlibrary/islandora`
2. `cd islandora`
3. `bundle`
4. `berks`
5. `vagrant plugin install vagrant-berkshelf --plugin-version '= 2.0.1'`
6. `vagrant plugin install vagrant-omnibus`
7. `vagrant up`
8. Enjoy your new Islandora instance at [http://localhost:8181](http://localhost:8181)!

## Known Issues

If you get an error like [this](https://gist.github.com/ruebot/439c6a23992e6660edcd) after step 7, you will need to edit the vagrant-berkshelf config as described [here](https://github.com/berkshelf/vagrant-berkshelf/issues/228#issue-47313643) or [here](https://github.com/berkshelf/vagrant-berkshelf/issues/228#issuecomment-62207197).

## License
[Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html)

## Author

* MJ Suhonos (<mjsuhonos@ryerson.ca>)
* Paul Church (<pchurch@ryerson.ca>)

## Acknowledgements

Many thanks to Graham Stewart and others at the University of Toronto Libraries for [LibraryChef](https://github.com/LibraryChef).
