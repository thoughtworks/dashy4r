require 'spec_helper'
require './lib/dashy4r'

describe Dashy::Base do
  xit "should report status" do
    success_report = ({:success => true }).merge(options)
    Dashy::RestInterface.report_status success_report
  end
end