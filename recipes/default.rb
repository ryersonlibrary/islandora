#
# Cookbook Name:: islandora
# Recipe:: default
#
# Copyright 2013, University of Toronto Libraries, Ryerson University Library and Archives
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

=begin
# Install packaged libraries
node[:islandora][:libraries].each do |library|
  package library
end

# Download & install Drush modules
node[:islandora][:drush_modules].each do |drush_mod|
  execute "drush download #{drush_mod}" do
    cwd node[:drupal][:dir]
    command "drush pm-download #{drush_mod}"
    user node[:drupal][:system][:user]
    group node[:drupal][:system][:group]
  end

  execute "drush enable #{drush_mod}" do
    cwd node[:drupal][:dir]
    command "drush pm-enable #{drush_mod}"
    user node[:drupal][:system][:user]
    group node[:drupal][:system][:group]
  end
end
=end

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
