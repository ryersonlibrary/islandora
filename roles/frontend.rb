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

name "frontend"
description "Configure a frontend Drupal node"

run_list(
  'recipe[islandora::frontend]',
)

override_attributes(
  # Set Drupal & Drush versions
  'drupal' => {
    'version' => '7.26',
    'checksum' => '8ec209228d1bfde68d3a2083aeefff1a874a6ffef3df605bd721e0bae650585d',
    'db' => {
      'password' => 'islandora'
    },
    'drush' => {
      'version' => '7.x-5.9',
      'checksum' => '3acc2a2491fef987c17e85122f7d3cd0bc99cefd1bc70891ec3a1c4fd51dccee',      
    },
  },
  
  # required MySQL defaults
  'mysql' => {
    'server_root_password' => 'rootpass',
    'server_repl_password' => 'replpass',
    'server_debian_password' => 'debpass',
    'bind_address' => 'localhost',
  }
)