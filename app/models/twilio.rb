require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

class TwilioSender

  def grab_pizza_data
    Grab_Pizza_Info.scrape_cb_site
  end

  def self.send_text_message

    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token

    pizza_from_data = Pizza.get_pizza_of_day
    users = User.all
    users.each do |user|
      puts "Sending to user phone number: #{user.phone}"

    message = @client.account.messages.create(
        :body => pizza_from_data.description,
        :to => user.phone,
        :from => ENV['TWILIO_NUMBER'])
    end
  end
end

