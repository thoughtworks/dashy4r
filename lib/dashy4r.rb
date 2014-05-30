dashy_files = [
                'base',
                'config_yml',
                'rest_interface',
                'runner'
              ]

dashy_files.each do |file|
  require File.join('./dashy', file)
end
