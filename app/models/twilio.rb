require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

class TwilioSender

  def grab_pizza_data
    Grab_Pizza_Info.scrape_cb_site
  end

  def self.send_text_message

    account_sid = 'AC30cde2b7f1b821359f9729bb6c53a689'
    auth_token = 'f4a6224be57c1498af087423cc40d3c9'
    @client = Twilio::REST::Client.new account_sid, auth_token

    pizza_from_data = Pizza.get_pizza_of_day
    users = User.all
    users.each do |user|
      puts "Sending to user phone number: #{user.phone}"

    message = @client.account.messages.create(
        :body => pizza_from_data.description,
        :to => user.phone,
        :from => "16506662041")
    end
  end
end

