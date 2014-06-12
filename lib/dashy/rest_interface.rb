require 'rubygems'
require 'system_timer'
require 'rest_client'

module Dashy
  class RestInterface

    def self.report_status options = {}
      return unless Dashy::Base.enabled?
      begin
        config = Dashy::Base.config
        SystemTimer.timeout_after(config.timeout) do
          RestClient.post "#{config.url}/api/requests/#{config.app_id}", :request => options
        end
      rescue => e
        puts e
      end
    end
  end
end