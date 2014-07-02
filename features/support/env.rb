require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'logger'
require 'rspec'
require 'debugger'

# directories loaded at the start of test suite
Dir.glob(File.join("./pageobjects", "c*", "*.rb")).each do |file|
  require file
end

Dir.glob(File.join("./pageobjects", "p*", "*.rb")).each do |file|
  require file
end

# load ymls with env data
$SETUP=YAML::load(File.open("config/environments/#{ENV['ENVIRONMENT']}.yml"))


Capybara.configure do |config|
  config.default_driver = :selenium
  config.javascript_driver = :poltergeist
  config.run_server = false
  config.default_selector = :css
  config.ignore_hidden_elements = false
end
