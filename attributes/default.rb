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
default['drupal']['modules'] = [
  'libraries',
  'advanced_help',
  'imagemagick',
  'ctools',
  'token',
  'views',
  'jquery_update-7.x-2.x', # use latest dev version for compatibility with JQuery 1.10
]

# Islandora-specific libraries
default['islandora']['libraries'] = [
  # core libraries
  'php-soap',
  'php5-curl',
  'php5-xsl',

  # image-handling libraries
  'php5-imagick',
  'graphicsmagick-imagemagick-compat',

  # OCR
  'poppler-utils',
  'tesseract-ocr',

  # media-handling libraries
  'ffmpeg',
  'ffmpeg2theora',
  'lame',
  'libavcodec-extra-53',
  'libimage-exiftool-perl',
  'libogg0',
  'libtheora0',
  'libvorbis0a',
]

default['islandora']['version'] = '7.x-1.3-RC1'

# Islandora modules by github repo name
# NB: ORDER MATTERS HERE FOR DEPENDENCIES
default['islandora']['repos'] = [
  # core modules
  'php_lib',
  'islandora',
  'objective_forms',
  
  # solr indexing
  'islandora_solr_search',
  'islandora_solr_metadata',
  'islandora_solr_facet_pages',
#  'islandora_solr_views', # Solr Views is not part of foundation yet

  'islandora_xml_forms',
#  'islandora_xmlsitemap',
  'islandora_xacml_editor',
  'islandora_marcxml',
  'islandora_oai',
  'islandora_ocr',
  'islandora_batch',
  'islandora_book_batch',
  'islandora_bookmark',
  'islandora_importer',
  'islandora_jwplayer',
  'islandora_bagit',
  'islandora_premis',
  'islandora_fits',
  'islandora_checksum',
  'islandora_checksum_checker',
  'islandora_image_annotation',
  'islandora_sync',
  'islandora_scholar',
  'islandora_paged_content',
  'islandora_simple_workflow',
  'islandora_internet_archive_bookreader',
  'islandora_openseadragon',

  # solution packs
  'islandora_solution_pack_audio',
  'islandora_solution_pack_book',
  'islandora_solution_pack_collection',
  'islandora_solution_pack_compound',
  'islandora_solution_pack_image',
  'islandora_solution_pack_large_image',
  'islandora_solution_pack_newspaper',
  'islandora_solution_pack_pdf',
  'islandora_solution_pack_video',
  'islandora_solution_pack_web_archive',
]

# Islandora modules that need to be explicitly enabled
default['islandora']['modules'] = [
  'xml_forms',
  'xml_form_builder',
  'xml_schema_api',
  'xml_form_elements',
  'xml_form_api',
  'zip_importer',
  'islandora_basic_image',
  'islandora_solr_config',
  'jquery_update',
]