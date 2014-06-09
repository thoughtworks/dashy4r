require 'spec_helper'
require './lib/dashy4r'
require 'webmock/rspec'

describe Dashy::RestInterface do
  let(:options) {{ :environment => 'test', :endpoint => 'a_service' }}
  let(:success_report) { ({:success => true }).merge(options) }
  let(:failure_report) { ({:success => false }).merge(options) }
  let(:dashy_local_url) do
    config = Dashy::Base.config
    "#{config.url}/requests/#{config.app_id}"
  end

  before(:all) do
    file_path = "#{File.dirname(__FILE__)}/../dashy_config.yml"
    Dashy::Base.enable_with_config file_path
  end

  it "should report status with success" do
    stub_report_request! :success => true

    Dashy::RestInterface.report_status success_report

    expect(WebMock).to have_requested(:post, dashy_local_url).with success_report
  end

  it "should report status with failure" do
    stub_report_request! :success => false

    Dashy::RestInterface.report_status failure_report

    expect(WebMock).to have_requested(:post, dashy_local_url).with success_report
  end

  def stub_report_request!(status)
    stub_request(:post, dashy_local_url).
      with(
        :body =>
          {"request"=>
            {
              "environment"=> options[:environment].to_s,
              "endpoint"=> options[:endpoint].to_s,
              "success"=> status[:success].to_s
            }
          },
        :headers => {'Content-Type'=>'application/x-www-form-urlencoded'}
      ).to_return(:status => 200, :body => "", :headers => {})
  end
end