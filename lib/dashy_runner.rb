class DashyRunner

  def self.run_and_report_status_for &block
    DashyRunner.config_and_run do |runner|
      runner.block_to_run &block
    end
  end

  def self.config_and_run
    runner = DashyRunner.new
    yield runner
    runner.run
  end

  def block_to_run &block
    @block_to_run = block
  end

  def with_options options = {}
    @options = options
  end

  def valid_response? &block
    @valid_response_block = block
  end

  def run
    raise 'Please before running Dashy you need to set the block_to_run' unless @block_to_run
    begin
      response = @block_to_run.call
      DashyRestInterface.report_status(({:success => valid_response_after_calling_block?(response)}).merge(extra_options))
      return response
    rescue StandardError => e
      DashyRestInterface.report_status(({:success => false}).merge(extra_options))
      raise
    end
  end


  protected
  def valid_response_after_calling_block? response
    return true unless @valid_response_block
    @valid_response_block.call response
  end

  def extra_options
    @options || {}
  end

end
