dashy4r
=======

dashy4r is a gem that helps you use ruby to integrate with [Dashy](https://github.com/rafbgarcia/dashy)

## Documentation

### dashy4r

    Create a file dashy_config.yml
    app_id: <YOUR_APP_ID>
    url: http://localhost:3000
    timeout: 1


    Dashy.enable_with_config 'path for your dashy_config.yml'


# Simplest way of reporting status
# It will fail if any exception is raised
    DashyRunner.run_and_report_status_for do
      run_something_that_you_want_to_report_status
    end

# A more complete Runner setup where you can set
# options and also validate the response
# the response is the return of your block to run
    DashyRunner.config_and_run do |runner|
      runner.with_options  :endpoint => 'My Web Service'
      runner.block_to_run { run_something_that_you_want_to_report_status_and_returns_something }
      runner.valid_response? do |response|
        validates_response_and_returns_a_boolean(response)
      end
    end
