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
default['drupal_filter']['version'] = "3.7.0"
default['drupal_filter']['sha256'] = '05902a56c81e0db059b51c145dfb245149dbe55f671fa6cda8fc23d2a2b7a194'
default['gsearch_extensions']['sha256'] = '3ac33b024a24851584cc4adaa83410133f9b31d14b32659e8d2872a92eafcf5d'
default['gsearch_extensions-dependencies']['sha256'] = '60cad9aecad432ca490bcea490b709d4fb65f843f4d6e54014dd984663500bfa'
default['openseadragon_js']['sha256'] = '9059b3b7d62b4d9891f59cb0cc37317c766ca32c6160727159198da18bfe86be'
default['solr-iso639-filter']['sha256'] = 'd5533a2f22b2a99f1a0e2105388bea02a9f2c3c24bfc0bf3a5549eedf85608a9'
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
  # 'tesseract-ocr', # TODO: needs to be built against a newer version

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
  'relation', # NB dependency for islandora_sync 
  'field_collection', # NB dependency for islandora_sync
  'views_ui',
  'xmlsitemap', # NB dependency for islandora_xmlsitemap
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
  'islandora_fits',
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

# Islandora modules with funky dependencies
default['islandora']['funkymodules'] = [
  'islandora_internet_archive_bookreader',
  'islandora_sync',
  'islandora_openseadragon',
  'islandora_xmlsitemap',
  'islandora_bagit',
]

# Islandora supplemental funky modules to explicitly enable
default['islandora']['modulesToEnable'] = [
  'islandora_sync_field_collection',
  'islandora_sync_relation',
  'relation_ui',
]

# supplementary downloads for islandora
default['islandora']['supp_downloads'] = [
  { 
    'dirname' => 'bookreader',
    'repo'    => 'git://github.com/openlibrary/bookreader.git',
  },
  { 
    'dirname' => 'BagItPHP',
    'repo'    => 'git://github.com/scholarslab/BagItPHP.git',
  },
]

# JWPlayer specific
default['jwplayer']['version'] = "6.8"
default['jwplayer']['sha256'] = '87ad00cab2759440bc18487d0afc159c569e1b942abf3b171f80d74549d3139f'

# FITS specific
default['fits']['version'] = "0.6.2"
default['fits']['sha256'] = '76566872f960115404c98b1bb1f9151a5805fc7384cb254c08152d11415c1354'
default['fits']['installpath'] = "/usr/share/fits"
default['fits']['shellpath'] = "/usr/share/fits/fits.sh"
default['fits']['techmd_dsid'] = "TECHMD"
  
# Kakadu specific
default['kakadu']['binarypath'] = "/usr/local/bin/kdu_compress"

# Leptonic specific
#default['leptonica']['sha256'] = 'd3d209a1f6d1f7a80119486b5011bc8c6627e582c927ab44ba33c37edb2cfba2'
#default['leptonica']['version'] = '1.70'
#default['leptonica']['installpath'] = "/usr/share/leptonica"

# Tesseract specific
default['tesseract']['sha256'] = '26cd39cb3f2a6f6f1bf4050d1cc0aae35edee49eb49a92df3cb7f9487caa013d'
default['tesseract']['version'] = '3.02.02'
default['tesseract']['installpath'] = '/usr/share/tesseract'
default['tesseract']['binarypath'] = '/usr/local/bin/tesseract'
default['tesseract_engdata']['sha256'] = 'c110029560e7f6d41cb852ca23b66899daa4456d9afeeae9d062204bd271bdf8'
default['tesseract_engdata']['version'] = '3.02'
default['tesseract_engdata']['installpath'] = '/usr/local/share/tessdata'
         
# Audio collection specific
default['audio']['lamearg'] = "/usr/bin/lame"
  
# Video and audio player specific
default['jwplayer']['arg'] = "array('name' => array('none' => 'none', 'islandora_jwplayer' => 'islandora_jwplayer'), 'default' => 'islandora_jwplayer')"

# IA bookreader
default['bookreader']['arg'] = "array('name' => array('none' => 'none', 'islandora_internet_archive_bookreader' => 'islandora_internet_archive_bookreader'), 'default' => 'islandora_internet_archive_bookreader')"

# openseadragon defaults
default['openseadragon']['arg'] = "array('name' => array('none' => 'none', 'islandora_openseadragon' => 'islandora_openseadragon'), 'default' => 'islandora_openseadragon')"
default['openseadragon']['tilesize'] = "256"
default['openseadragon']['tileoverlap'] = "0"
default['openseadragon']['settings'] = "array('debugMode' => 0, 
                                            'djatokaServerBaseURL' => 'http\:\/\/localhost\:8080\/adore-djatoka\/resolver',
                                            'animationTime' => '1.5',
                                            'blendTime' => '0.1',
                                            'alwaysBlend' => 0,
                                            'autoHideControls' => 1,
                                            'immediateRender' => 0,
                                            'wrapHorizontal' => 0,
                                            'wrapVertical' => 0,
                                            'wrapOverlays' => 0,
                                            'panHorizontal' => 1,
                                            'panVertical' => 1,
                                            'showNavigator' => 1,
                                            'minZoomImageRatio' => '0.8',
                                            'maxZoomPixelRatio' => '2',
                                            'visibilityRatio' => '0.5',
                                            'springStiffness' => '5.0',
                                            'imageLoaderLimit' => '5',
                                            'clickTimeThreshold' => '300',
                                            'clickDistThreshold' => '5',
                                            'zoomPerClick' => '2.0',
                                            'zoomPerScroll' => '1.2',
                                            'zoomPerSecond' => '2.0',
                                     )"
        
# Solrfield
default['solrfield']['arg'] = "RELS_EXT_isMemberOf_uri_ms"

# ingest derivatives field
default['ingestderivatives']['arg'] = "array('pdf' => 'pdf', 'image' => 'image', 'ocr' => 'ocr')"  
      
## default parameters for islandora configuration
default['islandora']['default_params'] = [
  {
    'name'     => 'set_fits_path',
    'action'   => :php_eval,
    'variable' => 'islandora_fits_executable_path',
    'value'    => default['fits']['shellpath'],
  },
  {
    'name'     => 'set_fits_metadata_dsid',
    'action'   => :php_eval,
    'variable' => 'islandora_fits_techmd_dsid',
    'value'    => default['fits']['techmd_dsid'],
  },
  {
    'name'     => 'set_kakadu_path',
    'action'   => :php_eval,
    'variable' => 'islandora_kakadu_url',
    'value'    => default['kakadu']['binarypath'],
  },
  {
    'name'     => "set_default_audio_player",
    'action'   => :php_eval_noquote,
    'variable' => "islandora_audio_viewers",
    'value'    => default['jwplayer']['arg'],
  },
  {
    'name'     => "set_default_audio_lame_url",
    'action'   => :php_eval,
    'variable' => "islandora_lame_url",
    'value'    => default['audio']['lamearg'],
  },
  {
    'name'     => "set_default_video_player",
    'action'   => :php_eval_noquote,
    'variable' => "islandora_video_viewers",
    'value'    => default['jwplayer']['arg'],
  },
  {
    'name'     => "set_default_bookreader_book_viewer",
    'action'   => :php_eval_noquote,
    'variable' => "islandora_book_viewers",
    'value'    => default['bookreader']['arg'],
  },
  {
    'name'     => 'set_default_bookreader_page_viewer',
    'action'   => :php_eval_noquote,
    'variable' => "islandora_book_page_viewers",
    'value'    => default['openseadragon']['arg'],
  },
  {
    'name'     => 'set_default_bookreader_ingest_derivatives',
    'action'   => :php_eval_noquote,
    'variable' => "islandora_book_ingest_derivatives",
    'value'    => default['ingestderivatives']['arg'],
  },
  {
    'name'     => 'set_default_book_parent_solr_field',
    'action'   => :php_eval,
    'variable' => "islandora_book_parent_book_solr_field",
    'value'    => default['solrfield']['arg'],
  },
  {
    'name'     => "set_default_newspaper_issue_viewer",
    'action'   => :php_eval_noquote,
    'variable' => "islandora_newspaper_issue_viewers",
    'value'    => default['bookreader']['arg'],
  },
  {
    'name'     => 'set_default_newspaper_page_viewer',
    'action'   => :php_eval_noquote,
    'variable' => "islandora_newspaper_page_viewers",
    'value'    => default['openseadragon']['arg'],
  },
  {
    'name'     => 'set_default_newspaper_ingest_derivatives',
    'action'   => :php_eval_noquote,
    'variable' => "islandora_newspaper_ingest_derivatives",
    'value'    => default['ingestderivatives']['arg'],
  },
  {
    'name'     => 'set_default_newspaper_solr_field',
    'action'   => :php_eval,
    'variable' => "islandora_newspaper_parent_issue_solr_field",
    'value'    => default['solrfield']['arg'],
  },
  {
    'name'     => 'set_default_openseadragon_tile_size',
    'action'   => :php_eval,
    'variable' => "islandora_openseadragon_tile_size",
    'value'    => default['openseadragon']['tilesize'],
  },
  {
    'name'     => 'set_default_openseadragon_tile_overlap',
    'action'   => :php_eval,
    'variable' => "islandora_openseadragon_tile_overlap",
    'value'    => default['openseadragon']['tileoverlap'],
  },
  {
    'name'     => 'set_default_openseadragon_settings',
    'action'   => :php_eval_noquote,
    'variable' => "islandora_openseadragon_settings",
    'value'    => default['openseadragon']['settings'],
  },
  {
    'name'     => 'set_default_tesseract_path',
    'action'   => :php_eval,
    'variable' => "islandora_ocr_tesseract",
    'value'    => default['tesseract']['binarypath'],
  },
]




