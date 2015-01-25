require_relative 'config/application'
require_relative 'app/models/twilio'

# puts "Put your application code in #{File.expand_path(__FILE__)}"
# puts "Hello world from pizzaphone"

TwilioSender.grab_pizza_data
TwilioSender.send_text_message

