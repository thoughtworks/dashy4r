require 'spec_helper'
require './lib/dashy4r'

describe Dashy::Base do
  it "should set config" do
    file_path = "#{File.dirname(__FILE__)}/../dashy_config.yml"
    Dashy::Base.enable_with_config file_path

    config = Dashy::Base.config

    expect(config.app_id).to eq 123
    expect(config.url).to eq 'http://localhost:3000'
    expect(config.timeout).to eq 1
  end

  it "should be enabled by default" do
    file_path = "#{File.dirname(__FILE__)}/../dashy_config.yml"
    Dashy::Base.enable_with_config file_path

    expect(Dashy::Base.enabled?).to eq true
  end
end