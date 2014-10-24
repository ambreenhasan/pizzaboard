require_relative '../app/models/pizza'
require_relative '../app/models/pizzaoftheday'
require_relative '../app/models/scraper'

User.create(name: 'Jeremy', phone: '+18134284549')
User.create(name: 'Ambreen', phone: '+15103862974')
User.create(name: 'Shirley', phone: '+17075145821')
User.create(name: 'Tam', phone: '+14155950175')

#Pizza.create(description: "Hot Sweet Pizza", date: '2014-10-24')
pizzas = Grab_Pizza_Info.scrape_cb_site
# puts "pizzas is:"
# p pizzas


pizzas.each do |pizza|
  pod1 = PizzaOfTheDay.new(pizza)
  Pizza.set_pizza_of_day(pod1)
end
