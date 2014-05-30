module Dashy
  class Base

    def self.enable_with_config config_file_path
      @config = Dashy::ConfigYml.new config_file_path
      @enabled = true
    end

    def self.enabled?
      @enabled
    end

    def self.config
      @config
    end
  end
end