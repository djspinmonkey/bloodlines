load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy'

namespace :deploy do

  task :restart do
    sudo "/usr/local/etc/rc.d/bloodlines restart"
  end

  task :after_update_code do
    sudo "cp #{release_path}/build/init_script /usr/local/etc/rc.d/bloodlines"
    sudo "chmod a+x /usr/local/etc/rc.d/bloodlines"
  end

end
