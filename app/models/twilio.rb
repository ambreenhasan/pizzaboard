require_relative '../../config/application'

class TwilioSender

  def self.grab_pizza_data
    Grab_Pizza_Info.scrape_cb_site
  end

  def self.send_text_message

    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token

    pizza_from_data = Pizza.get_pizza_of_day
    users = User.all
    users.each do |user|
      if user.deliverable == true
        puts "Sending to user phone number: #{user.phone}"
        puts pizza_from_data.description

    message = @client.account.messages.create(
        :body => pizza_from_data.description,
        :to => user.phone,
        :from => ENV['TWILIO_NUMBER'])
      end
    end
  end
end

