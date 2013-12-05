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

name "backend"
description "Configure a backend Java node"

run_list(
  # these recipes have to be applied in this order:
  # djatoka modifies tomcat's startup CLASSPATH so it has to be installed first
  'recipe[djatoka]',
  'recipe[solr]',
  'recipe[fedora]',
  # gsearch depends on fedora and solr being installed
  'recipe[gsearch]',
)

override_attributes(
  # Use Java 7
  'java' => {
    'jdk_version' => '7'
  }
)