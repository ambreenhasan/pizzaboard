require_relative '../config/application'
# create a user by entering your name and phone number in the empty strings below
User.create(name: '', phone: '', deliverable: true)


pizzas = Grab_Pizza_Info.scrape_cb_site


pizzas.each do |pizza|
  pod1 = PizzaOfTheDay.new(pizza)
  Pizza.set_pizza_of_day(pod1)
end
