require_relative '../app/models/pizza'
require_relative '../app/models/pizzaoftheday'
require_relative '../app/models/scraper'

# create a user by entering your name and phone number in the empty strings below
User.create(name: 'Ambreen', phone: '15103862974')



pizzas = Grab_Pizza_Info.scrape_cb_site


pizzas.each do |pizza|
  pod1 = PizzaOfTheDay.new(pizza)
  Pizza.set_pizza_of_day(pod1)
end
