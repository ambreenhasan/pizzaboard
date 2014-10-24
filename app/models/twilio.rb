#gem 'twilio-ruby', '~> 3.12'
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
#require_relative "scraper.rb"


class TwilioSender

  def grab_pizza_data
    Grab_Pizza_Info.scrape_cb_site
  end

  # def connect_and_iterate_subscriber_list
  # end

  def self.send_text_message
    #DATABASERECORDS
    #View.display
    #TWILIO
    account_sid = 'ACf3e3cedbc8f67dbbd7437a67e8297082'
    auth_token = '5251a57a7f7b6f997e6bb01b41024bc9'
    @client = Twilio::REST::Client.new account_sid, auth_token

    pizza_from_data = Pizza.get_pizza_of_day
    users = User.all
    users.each do |user|
      puts "user.phone is #{user.phone}"

    message = @client.account.messages.create(
        :body => pizza_from_data.description,
        :to => user.phone,
        :from => "+14155992671") #+17075145821
    end
  end
end






# class View

#     def self.display
#       p date
#       p
#       p POD
#     #DATABASERECORDS
#     end
# end
