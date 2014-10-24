require 'date'
class PizzaOfTheDay
  attr_reader :description, :date

  def initialize(scraper_data)
    @description = scraper_data[0]
    @date = scraper_data[1]
    parse_date
  end

  def parse_date
    d = Date.parse(@date)
    @date = d.strftime("%Y-%m-%d")
  end

end


