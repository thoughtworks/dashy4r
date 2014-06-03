dashy4r
=======

dashy4r is a gem that helps you use ruby to integrate with [Dashy](https://github.com/thoughtworks/dashy)

## Documentation

### Configuration file
Create a file dashy_config.yml
```yaml
app_id: <YOUR_APP_ID>
url: <YOUR_DASHY_URL>
timeout: <YOUR_TIMEOUT_IN_SECONDS>
```

### Enable configuration
```ruby
  Dashy::Base.enable_with_config '<path for your dashy_config.yml>'
```

### Usage

Simplest way of reporting status. It will fail if any exception is raised
```ruby
  Dashy::Runner.run_and_report_status_for do
    # your code goes here
    run_something_that_you_want_to_report_status
  end
```

A more complete Runner setup where you can set options and also validate the response the response is the return of your block to run
```ruby
  Dashy::Runner.config_and_run do |runner|
    runner.with_options  :environment => 'My Environment', :endpoint => 'My Web Service'
    runner.block_to_run do
      # your code goes here
      run_something_that_you_want_to_report_status_and_returns_something
    end
    runner.valid_response? do |response|
      # your code goes here
      validates_response_and_returns_a_boolean(response)
    end
  end
```

### Very Important
#### Works only with ruby 1.8.7
