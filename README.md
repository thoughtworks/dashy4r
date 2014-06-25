dashy4r
=======

dashy4r is a gem that helps you use ruby to integrate with [Dashy](https://github.com/thoughtworks/dashy)

[![Build Status](https://snap-ci.com/thoughtworks/dashy4r/branch/master/build_image)](https://snap-ci.com/thoughtworks/dashy4r/branch/master)

## Documentation

### Installing
    gem install dashy4r

## Usage

### Configuration file
Create a file dashy_config.yml
```
app_id: <YOUR_APP_ID>
url: <YOUR_DASHY_URL>
timeout: <YOUR_TIMEOUT_IN_SECONDS>
```

### Enable configuration
```ruby
  Dashy::Base.enable_with_config '<path for your dashy_config.yml>'
```

Simplest way of reporting status. It will fail if any exception is raised
```ruby
  require 'dashy4r'

  Dashy::Runner.run_and_report_status_for do
    # your code goes here
    run_something_that_you_want_to_report_status
  end
```

A more complete Runner setup where you can set options and also validate the response the response is the return of your block to run
```ruby
  require 'dashy4r'

  Dashy::Runner.config_and_run do |runner|
    runner.with_options  :name => 'My Web Service', :meta => { :environment => 'My Environment' }
    runner.block_to_run do
      # your code goes here (example with success response)
      1
    end
    runner.valid_response? do |response|
      # your code goes here (example with some conditional)
      response == 1
    end
  end
```

### Very Important
#### Works only with ruby 1.8.7
