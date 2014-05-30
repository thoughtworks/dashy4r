class DashyRestInterface

  def self.report_status options = {}
    return unless Dashy.enabled?
    begin
      SystemTimer.timeout_after(Dashy.config.timeout) do
        RestClient.post "#{Dashy.config.url}/requests/#{Dashy.config.app_id}", :request=> ({:environment => Rails.env, :endpoint => 'Title'}).merge(options)
      end
    rescue => e
    end
  end
end
