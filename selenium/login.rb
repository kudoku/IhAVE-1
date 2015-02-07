require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  @driver = Selenium::WebDriver.for :firefox
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
end

run do
	wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  @driver.get 'http://localhost:3000/'
  driver.switch_to.window("windowName")
	google_oauth = wait.until { @driver.find_element(id: "google_oauth") } 
  google_oauth_button = @driver.find_element(id: "google_oauth") 
  google_oauth_button.click
end