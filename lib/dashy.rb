class Dashy

  def self.enable_with_config config_file_path
    @config = DashyConfigYml.new config_file_path
    @enabled = true
  end

  def self.enabled?
    @enabled
  end

  def self.config
    @config
  end
end
