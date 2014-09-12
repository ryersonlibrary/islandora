
# Install useful ui modules
node['drupal']['extraModules'].each do |param|
  drupal_module param do
    dir node['drupal']['dir']
    action :install
  end
end


