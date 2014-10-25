require 'pathname'
require 'sqlite3'
require 'active_record'
require 'logger'
require 'Date'
require 'nokogiri'
require 'open-uri'
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

#unsure if the below is best practice, since the above are not folders?

require_relative '../app/models/pizza'
require_relative '../app/models/pizzaoftheday'
require_relative '../app/models/scraper'



APP_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))

APP_NAME = APP_ROOT.basename.to_s

DB_PATH  = APP_ROOT.join('db', APP_NAME + ".db").to_s

if ENV['DEBUG']
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

# Automatically load every file in APP_ROOT/app/models/*.rb, e.g.,
#   autoload "Person", 'app/models/person.rb'
#
# See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html

Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end

ActiveRecord::Base.establish_connection :adapter  => 'sqlite3',
                                        :database => DB_PATH
