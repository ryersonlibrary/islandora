name "frontend"
description "Configure a frontend Drupal node"

run_list(
  'recipe[drupal]',
  'recipe[drupal::drush]',
  'recipe[islandora]',
)

override_attributes(
  # Set Drupal & Drush versions
  'drupal' => {
    'version' => '7.23',
    'checksum' => '79f2ae06aac349b86fc0f6cd100f3fc34b72e9f46068ddf704d575778aae1f99',
    'drush' => {
      'version' => '7.x-5.9',
      'checksum' => '3acc2a2491fef987c17e85122f7d3cd0bc99cefd1bc70891ec3a1c4fd51dccee',      
    }
  },
  
  # required MySQL defaults
  'mysql' => {
    'server_root_password' => 'rootpass',
    'server_repl_password' => 'replpass',
    'server_debian_password' => 'debpass',
    'bind_address' => 'localhost',
  }

)