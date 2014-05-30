require 'yaml'

class DashyConfigYml
  DEFAULT_TIMEOUT = 1

  def initialize file_path
    @yaml ||= YAML.load_file(file_path)
  end

  def app_id
    @yaml['app_id']
  end

  def url
    @yaml['url']
  end

  def timeout
    @yaml['timeout'] || DEFAULT_TIMEOUT
  end
end
