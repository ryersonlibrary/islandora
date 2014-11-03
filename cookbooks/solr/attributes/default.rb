#
# Cookbook Name:: solr 
# Attributes:: default 
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

default['solr']['version'] = "4.2.0" # must be at least 4.2.0 due to filename change; versions > 4.2.0 fail for reasons currently unknown
default['solr']['sha256'] = "8726fa10c6b92aa1d2235768092ee2d4cd486eea1738695f91b33c3fd8bc4bd7"
default['solr']['installpath'] = "/usr/share/solr"
default['solr']['core_name'] = 'core1' # default core name
