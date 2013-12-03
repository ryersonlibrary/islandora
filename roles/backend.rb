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