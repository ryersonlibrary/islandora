#
# Cookbook Name:: islandora
# Recipe:: frontend-custom
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

# install uploadprogress PHP extension with PEAR/PECL
php_pear "uploadprogress" do
  action :install
end

# get jwplayer from jwplayer
ark 'jwplayer' do
  url "https://account.jwplayer.com/static/download/jwplayer-#{node['jwplayer']['version']}.zip"
  checksum node['jwplayer']['sha256']
  
  path "#{node['drupal']['dir']}/sites/all/libraries/jwplayer"
  action :put
end

# get FITS from Google Code
ark 'fits' do
  url "https://fits.googlecode.com/files/fits-#{node[:fits][:version]}.zip"
  version  node['fits']['version']
  checksum node['fits']['sha256']
  home_dir node['fits']['installpath']
end

# make FITS executable
file "/usr/share/fits/fits.sh" do
  mode "0755"
  action :touch
end

# download openseadragon javascript
ark 'openseadragon_js' do
  url "http://openseadragon.github.io/releases/openseadragon-bin-0.9.129.zip"
  checksum node['openseadragon_js']['sha256']
 
  path "#{node['drupal']['dir']}/sites/all/libraries/openseadragon"
  action :put
end


#  Download files required for funky dependencies from github
node['islandora']['supp_downloads'].each do |resource|
  # create the directory
  directory "#{node['drupal']['dir']}/sites/all/libraries/#{resource['dirname']}" do
    action :create
    recursive true
    user node['drupal']['system']['user']
    group node['drupal']['system']['group']
  end
  
  # download from github
  git "#{node['drupal']['dir']}/sites/all/libraries/#{resource['dirname']}" do
    repository "#{resource['repo']}"
    action :checkout
    user node['drupal']['system']['user']
    group node['drupal']['system']['group']
  end
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

# use Drush to set Islandora default parameters
node['islandora']['default_params'].each do |param|
  drupal_module param['name'] do
    dir node['drupal']['dir']
    action param['action'].to_sym
    variable param['variable']
    value param['value']
  end
end

#WARC tools
# install packages essential for WARC tools
execute "apt-get install" do
  environment ({'DEBIAN_FRONTEND' => 'noninteractive'})
  command "apt-get install python-setuptools python-unittest2 -y --force-yes"
  ignore_failure false
end

# download WARC tools from github
git "/home/vagrant/warctools" do
  repository "https://github.com/internetarchive/warctools.git"
  action :checkout
  user 'vagrant'
  group 'vagrant'
end

# run make commands on WARC tools
execute "warc build" do
  environment ({'DEBIAN_FRONTEND' => 'noninteractive'})
  command "cd /home/vagrant/warctools && ./setup.py build && sudo ./setup.py install"
  ignore_failure false
end

# Tesseract
# install leptonica
execute "apt-get install leptonica" do
  environment ({'DEBIAN_FRONTEND' => 'noninteractive'})
  command "apt-get install libleptonica-dev -y --force-yes"
  ignore_failure false
end

# download tesseract source
ark 'tesseract-ocr' do
  url "https://tesseract-ocr.googlecode.com/files/tesseract-ocr-#{node['tesseract']['version']}.tar.gz"
  version  node['tesseract']['version']
  checksum node['tesseract']['sha256']
  home_dir node['tesseract']['installpath']
end

# run make commands on tesseract source to build it
execute "tesseract build from source" do
  environment ({'DEBIAN_FRONTEND' => 'noninteractive'})
  command "cd #{node['tesseract']['installpath']} && sudo ./autogen.sh && sudo ./configure && sudo make && sudo make install && sudo ldconfig"
  creates "/usr/local/bin/tesseract"
  ignore_failure false
end

# download tesseract language data (english)
ark 'tesseract-ocr-english-language-data' do
  url "https://tesseract-ocr.googlecode.com/files/tesseract-ocr-#{node['tesseract_engdata']['version']}.eng.tar.gz"
  checksum node['tesseract_engdata']['sha256']
  path node['tesseract_engdata']['installpath']
  strip_components 2
  action :put
end

# place it in the tesseract directory
execute "move-english-language-files" do
  environment ({'DEBIAN_FRONTEND' => 'noninteractive'})
  command "cd #{node['tesseract_engdata']['installpath']} && sudo mv tesseract-ocr-english-language-data/* . && sudo rm -rf tesseract-ocr-english-language-data"
  ignore_failure false
end

