require_relative '../../config/application'

class Pizza < ActiveRecord::Base

  def self.set_pizza_of_day(pod)
    Pizza.create(description: pod.description, date: pod.date)
  end

  def self.get_pizza_of_day
    today = Date.today
    if today.wday == 1 || today.wday == 7
      puts "There is no pizza of the day on Monday or Sunday"
    else
      Pizza.where(date: Time.now.strftime("%Y-%m-%d") ).first
    end
  end
end
