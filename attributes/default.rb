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

# Islandora version to install
default['islandora']['version'] = '7.x-1.3-RC1'

# Checksums for Islandora-specific files
default['drupal_filter']['sha256'] = '05902a56c81e0db059b51c145dfb245149dbe55f671fa6cda8fc23d2a2b7a194'
default['solr-iso639-filter']['sha256'] = 'd5533a2f22b2a99f1a0e2105388bea02a9f2c3c24bfc0bf3a5549eedf85608a9'
default['gsearch_extensions']['sha256'] = '3ac33b024a24851584cc4adaa83410133f9b31d14b32659e8d2872a92eafcf5d'
default['gsearch_extensions-dependencies']['sha256'] = '60cad9aecad432ca490bcea490b709d4fb65f843f4d6e54014dd984663500bfa'
default['solr-php-client']['sha256'] = 'dfb74b2cb496a9669b115a4bc32a00b2bb5cc0505026167c486c437799bb4ce7'

# Islandora-specific libraries / packages
default['islandora']['libraries'] = [
  # core libraries
  'php-soap',
  'php5-curl',
  'php5-xsl',

  # image-handling libraries
  'php5-imagick',
  'imagemagick',
  'graphicsmagick-imagemagick-compat',

  # OCR
  'poppler-utils',
  'tesseract-ocr', # TODO: needs to be built against a newer version

  # media-handling libraries
  'ffmpeg', # TODO: needs to be built against a newer version
  'ffmpeg2theora',
  'lame',
  'libavcodec-extra-53',
  'libimage-exiftool-perl',
  'libogg0',
  'libtheora0',
  'libvorbis0a',

  'bibutils',
]

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

  # core/dependency modules
  'islandora_xml_forms',
  'islandora_marcxml',
  'islandora_oai',
  'islandora_ocr',
  'islandora_batch',
  'islandora_bookmark',
  'islandora_importer',
  'islandora_jwplayer',
  'islandora_scholar',
  'islandora_paged_content',

  'islandora_simple_workflow',
  'islandora_xacml_editor',

  # preservation modules
  'islandora_premis',
  'islandora_checksum',
  'islandora_checksum_checker',

  # solution packs
  'islandora_solution_pack_collection',
  'islandora_solution_pack_pdf',
  'islandora_solution_pack_audio',
  'islandora_solution_pack_book', # depends on islandora_paged_content
  'islandora_solution_pack_compound',
  'islandora_solution_pack_image',
  'islandora_solution_pack_large_image',
  'islandora_solution_pack_newspaper',
  'islandora_solution_pack_video',
  'islandora_solution_pack_web_archive',

  # these have to go at the end
  'islandora_book_batch',  
  'islandora_image_annotation',

  # these modules have funky dependencies
#  'islandora_fits',
#  'islandora_internet_archive_bookreader',
#  'islandora_sync',
#  'islandora_openseadragon',
#  'islandora_xmlsitemap',
#  'islandora_bagit',

]

# Islandora modules that need to be explicitly enabled
# NB: ORDER MATTERS HERE FOR DEPENDENCIES
default['islandora']['modules'] = [
  # core modules
  'xml_forms',
  'xml_form_builder',
  'xml_schema_api',
  'xml_form_elements',
  'xml_form_api',
  'jquery_update',
  'zip_importer', # depends on islandora_solution_pack_collection

  # solution pack modules
  'islandora_basic_image',
  'islandora_bibliography',
  'islandora_compound_object',
  'islandora_google_scholar',
  'islandora_scholar_embargo',

  'islandora_solr_config',
#  'islandora_solr_geo',

  # scholar citation modules
  'citation_exporter',
  'doi_importer',
  'endnotexml_importer',
  'pmid_importer',
  'ris_importer',
]
