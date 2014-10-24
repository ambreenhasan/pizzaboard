require_relative 'config/application'
require_relative 'app/models/twilio'
require_relative 'app/models/scraper'
require_relative 'app/models/pizzaoftheday'
require_relative 'app/models/pizza'

puts "Put your application code in #{File.expand_path(__FILE__)}"
puts "Hello world from pizzaphone"


## Scrape CheeseBoard for weekly pizzas
pizzas = Grab_Pizza_Info.scrape_cb_site
puts "pizzas is:"
p pizzas
pizzas.each do |pizza|
  pod1 = PizzaOfTheDay.new(pizza)
  Pizza.set_pizza_of_day(pod1)
end
#TwilioSender.send_text_message

