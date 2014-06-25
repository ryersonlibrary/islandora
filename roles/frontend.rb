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
  'recipe[islandora::frontend-custom]',
)

override_attributes(
  # Set Drupal & Drush versions
  'drupal' => {
    'version' => '7.28',
    'checksum' => '941b6de8978d215c95fe6f8466e3cb212f16647de93b38bbc41df020fd6e5eaa',
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