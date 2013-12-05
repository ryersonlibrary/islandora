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

# Islandora-specific attributes
default[:islandora][:drush_modules] = [
  'advanced_help',
  'ctools',
  'imagemagick',
  'libraries',
  'token',
  'views',
]

default[:islandora][:libraries] = [
  'ffmpeg',
  'ffmpeg2theora',
  'imagemagick',
  'lame',
  'libavcodec-extra-53',
  'libimage-exiftool-perl',
  'libogg0',
  'libtheora0',
  'libvorbis0a',
  'php-soap',
  'php5-curl',
  'php5-xsl',
  'php5-imagick',
  'tesseract-ocr',
]

default[:islandora][:repos] = [
  'islandora',
  'islandora_batch',
  'islandora_bookmark',
  'islandora_fits',
  'islandora_importer',
  'islandora_internet_archive_bookreader',
  'islandora_jwplayer',
  'islandora_marcxml',
  'islandora_oai',
  'islandora_ocr',
  'islandora_openseadragon',
  'islandora_paged_content',
#  'islandora_pathauto',
  'islandora_solr_search',
#  'islandora_solr_search/islandora_solr_config',
  'islandora_solr_views',
  'islandora_solution_pack_audio',
  'islandora_solution_pack_book',
  'islandora_solution_pack_collection',
  'islandora_solution_pack_image',
  'islandora_solution_pack_large_image',
  'islandora_solution_pack_pdf',
  'islandora_solution_pack_video',
  'islandora_xml_forms',
  'objective_forms',
  'php_lib',
#  'tuque'
]
