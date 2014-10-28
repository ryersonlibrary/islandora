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

name "backend"
description "Configure a backend Java node"

run_list(
  'recipe[ubuntu-baseline]',
  'recipe[tomcat]',
  'recipe[djatoka]', # NB: djatoka modifies tomcat's startup CLASSPATH so it has to be installed first
  'recipe[fedora-commons::mysql]',
  'recipe[solr]',
  'recipe[gsearch]', # NB: gsearch depends on fedora and solr being installed
  'recipe[islandora::backend]',
)

override_attributes(
  # Use Tomcat 7
  "tomcat" => { "base_version" => "7" },

  # Use Java 7
  "java" => {
    "jdk_version" => "7",
    "install_flavor" => "oracle", # djatoka requires the Oracle JDK
    "oracle" => { "accept_oracle_download_terms" => true }
  }
)