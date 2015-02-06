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
  @driver.get 'http://localhost:3000/'

  logout_button = @driver.find_element(id: 'sign-in-button')
  expect(logout_button).to eq('sign-in-button')
end