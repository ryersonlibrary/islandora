#
# Cookbook Name:: islandora
# Recipe:: frontend
#
# Copyright 2014, University of Toronto Libraries, Ryerson University Library and Archives
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

# Install packaged libraries on the system
if platform?("ubuntu")
  node['islandora']['libraries'].each do |library|
    package library
  end
end

# TODO: modify apache/php recipes to enable changing php.ini values
# eg. memory_limit, upload_limit

# Install Drupal, including specified modules
include_recipe 'drupal::install'

include_recipe 'git'

# Checkout tuque git repository as library
directory "#{node['drupal']['dir']}/sites/all/libraries/tuque" do
  action :create
  recursive true
  user node['drupal']['system']['user']
  group node['drupal']['system']['group']
end

git "#{node['drupal']['dir']}/sites/all/libraries/tuque" do
  repository "git://github.com/Islandora/tuque.git"
  action :checkout
  user node['drupal']['system']['user']
  group node['drupal']['system']['group']
end

# Install Islandora modules
node['islandora']['repos'].each do |repo|
  
  # Checkout git repositories as Drupal modules
  git "#{node['drupal']['dir']}/sites/all/modules/#{repo}" do
    repository "git://github.com/Islandora/#{repo}.git"
    action :checkout
    branch node['islandora']['version']
    user node['drupal']['system']['user']
    group node['drupal']['system']['group']
  end

  # strip "solution pack" out of the repo name for the module
  mod = repo.sub('solution_pack_','')

  # Use Drush to install downloaded modules
  drupal_module mod do
    dir node['drupal']['dir']
    action :install
  end
end

# Install remaining modules
node['islandora']['modules'].each do |mod|
  drupal_module mod do
    dir node['drupal']['dir']
    action :install
  end
end

# get Solr PHP client from Google Code
ark 'solr-php-client' do
  url "https://solr-php-client.googlecode.com/files/SolrPhpClient.r22.2009-11-09.tgz"
  checksum node['solr-php-client']['sha256']

  path "#{node['drupal']['dir']}/sites/all/modules/islandora_solr_search"
  action :put
end

# install uploadprogress PHP extension
php_pear "uploadprogress" do
  action :install
end

# get jwplayer from jwplayer
ark 'jwplayer' do
  url "https://account.jwplayer.com/static/download/jwplayer-6.8.zip"
  checksum node['jwplayer']['sha256']
 
  path "#{node['drupal']['dir']}/sites/all/libraries/jwplayer"
  action :put
end

# get FITS from Google Code
ark 'fits' do
  url "https://fits.googlecode.com/files/fits-#{node[:fits][:version]}.zip"
  version  node[:fits][:version]
  checksum node[:fits][:sha256]
  home_dir node[:fits][:installpath]
end

# make FITS executable
file "/usr/share/fits/fits.sh" do
  mode "0755"
  action :touch
end

# use drush to set FITS default path in Drupal database
drupal_module 'set_fits_path' do
  dir node['drupal']['dir']
  action :php_eval
  variable 'islandora_fits_executable_path'
  value node[:fits][:shellpath]
end

# use drush to set Kadaku default path in Drupal database
drupal_module 'set_kadaku_path' do
  dir node['drupal']['dir']
  action :php_eval
  variable 'islandora_kakadu_url'
  value node[:kakadu][:binarypath]
end

# use drush to set default player in islandora video solution pack
drupal_module 'set_default_video_player' do
  dir node['drupal']['dir']
  action :php_eval_noquote
  variable 'islandora_video_viewers'
  value node[:audiovideo][:arg]
end

# use drush to set default player in islandora audio collection
drupal_module 'set_default_audio_player' do
  dir node['drupal']['dir']
  action :php_eval_noquote
  variable 'islandora_audio_viewers'
  value node[:audiovideo][:arg]
end

# create the bookreader directory
directory "#{node['drupal']['dir']}/sites/all/libraries/bookreader" do
  action :create
  recursive true
  user node['drupal']['system']['user']
  group node['drupal']['system']['group']
end

# download the openlibrary bookreader from github
git "#{node['drupal']['dir']}/sites/all/libraries/bookreader" do
  repository "git://github.com/openlibrary/bookreader.git"
  action :checkout
  user node['drupal']['system']['user']
  group node['drupal']['system']['group']
end

# download openseadragon javascript
ark 'openseadragon_js' do
  url "http://openseadragon.github.io/releases/openseadragon-bin-0.9.129.zip"
  checksum node['openseadragon_js']['sha256']
 
  path "#{node['drupal']['dir']}/sites/all/libraries/openseadragon"
  action :put
end


# Install Islandora modules with funky dependencies
node['islandora']['funkymodules'].each do |funkymodule|
  
  # Checkout git repositories as Drupal modules
  git "#{node['drupal']['dir']}/sites/all/modules/#{funkymodule}" do
    repository "git://github.com/Islandora/#{funkymodule}.git"
    action :checkout
    branch node['islandora']['version']
    user node['drupal']['system']['user']
    group node['drupal']['system']['group']
  end

  # strip "solution pack" out of the repo name for the module
  # mod = repo.sub('solution_pack_','')

  # Use Drush to install downloaded modules
  drupal_module funkymodule do
    dir node['drupal']['dir']
    action :install
  end
end

# Enable some modules that were installed above
node['islandora']['modulesToEnable'].each do |enableMod|
  drupal_module enableMod do
    dir node['drupal']['dir']
    action :enable
  end
end


# use drush to set the default bookreader viewer
drupal_module 'set_default_bookreader_viewer' do
  dir node['drupal']['dir']
  action :php_eval_noquote
  variable 'islandora_book_viewers'
  value node[:bookreader][:arg]
end
