require_relative 'config/application'
require_relative 'app/models/twilio'
require_relative 'app/models/scraper'
require_relative 'app/models/pizzaoftheday'
require_relative 'app/models/pizza'

# puts "Put your application code in #{File.expand_path(__FILE__)}"
# puts "Hello world from pizzaphone"

TwilioSender.send_text_message

