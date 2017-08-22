require 'yaml'
require 'rspec'
require 'watir-webdriver'
require 'watir/rspec'

require_relative  '../helpers/index'

# include pages
require_relative  '../lib/index'
require_relative  '../lib/login.page'
require_relative  '../lib/profile.page'

# i shoold set browser
# i shoold set user ?

# TEST_ENV = ENV['TEST_ENV']
TEST_ENV = "local"
CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../config/#{TEST_ENV}.yml")))
BASE_URL = CONFIG["base_url"]

RSpec.configure do |config|
  config.before :all do
    @browser = Watir::Browser.new :chrome
    # @base_url = CONFIG["base_url"]
    @user_email = CONFIG["administrator"]["email"]
    @user_pass = CONFIG["administrator"]["pass"]
    @user_role = CONFIG["administrator"]["role"]
  end
  config.after :all do
    @browser.close 
  end
end
