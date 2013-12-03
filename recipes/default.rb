#
# Cookbook Name:: islandora
# Recipe:: default
#
# Copyright (C) 2013 MJ Suhonos
# 
# MIT License <http://mit-license.org>
#

# Install packaged libraries
node[:islandora][:libraries].each do |library|
  package library
end

# Download & install Drush modules
node[:islandora][:drush_modules].each do |drush_mod|
  execute "drush download #{drush_mod}" do
    cwd node[:drupal][:dir]
    command "drush pm-download #{drush_mod}"
#    user node[:drupal][:system][:user]
#    group node[:drupal][:system][:group]
  end

=begin
  execute "drush enable #{drush_mod}" do
    cwd node[:drupal][:dir]
    command "drush pm-enable #{drush_mod}"
    user node[:drupal][:system][:user]
    group node[:drupal][:system][:group]
  end
=end
end

# Checkout Islandora git repositories
include_recipe 'git'

node[:islandora][:repos].each do |repo|
  git "#{node[:drupal][:dir]}/modules/#{repo}" do
    repository "git://github.com/Islandora/#{repo}.git"
    action :checkout
  end
end

# copy /var/www/drupal/htdocs/sites/default/default.settings.php -> settings.php
# ensure it is writable by www-data

# create directory /var/www/drupal/htdocs/sites/default/files
# ensure it is writable by www-data
