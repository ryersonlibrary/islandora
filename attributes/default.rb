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

# Required Drupal modules
default[:drupal][:modules] = [
  'libraries',
  'advanced_help',
  'imagemagick',
  'ctools',
  'token',
  'views',
]

# Islandora-specific libraries
default[:islandora][:libraries] = [
  # core libraries
  'php-soap',
  'php5-curl',
  'php5-xsl',
  'php5-imagick',
  'graphicsmagick-imagemagick-compat',

  # OCR
  'poppler-utils',

  # media-handling libraries
  'ffmpeg',
  'ffmpeg2theora',
  'lame',
  'libavcodec-extra-53',
  'libimage-exiftool-perl',
  'libogg0',
  'libtheora0',
  'libvorbis0a',
  'tesseract-ocr',
]

# Islandora modules by github repo name
# NB: ORDER MATTERS HERE FOR DEPENDENCIES
default[:islandora][:repos] = [
  # core modules
  'php_lib',
  'islandora',
  
  # solr indexing
  'islandora_solr_search',
  'islandora_solr_views',

  'objective_forms',
  'islandora_xml_forms',
  'islandora_marcxml',
  'islandora_oai',
  'islandora_batch',
  'islandora_bookmark',
  'islandora_fits',
  'islandora_importer',
  'islandora_jwplayer',
  'islandora_ocr',
#  'islandora_openseadragon',
  'islandora_paged_content',
  'islandora_internet_archive_bookreader',

  # solution packs
  'islandora_solution_pack_audio',
  'islandora_solution_pack_book',
  'islandora_solution_pack_collection',
  'islandora_solution_pack_image',
#  'islandora_solution_pack_large_image',
  'islandora_solution_pack_pdf',
  'islandora_solution_pack_video',
]
