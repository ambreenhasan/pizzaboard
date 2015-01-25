require_relative '../../config/application'

class Pizza < ActiveRecord::Base

  def self.set_pizza_of_day(pod)
    Pizza.create(description: pod.description, date: pod.date)
  end

  def self.get_pizza_of_day
    today = Date.today

    if today.wday == 1
      puts "There is no pizza of the day on Monday. Sending Tuesday's pizza"
      Pizza.where(date: (DateTime.now + 1).strftime("%Y-%m-%d") ).first
    elsif today.wday == 0
      puts "There is no pizza of the day on Sunday. Sending Tuesday's pizza"
      Pizza.where(date: (DateTime.now + 2).strftime("%Y-%m-%d") ).first
    else
      Pizza.where(date: DateTime.now.strftime("%Y-%m-%d") ).first
    end
  end
end
