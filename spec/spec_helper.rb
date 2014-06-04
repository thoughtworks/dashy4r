Dir['./lib/**/*.rb'].each {|file| require file }
RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end