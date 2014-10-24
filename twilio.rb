#gem 'twilio-ruby', '~> 3.12'
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
#require_relative "scraper.rb"


class Run

  def grab_pizza_data
    Grab_Pizza_Info.scrape_cb_site
  end

  # def connect_to_subscriber_list
  # end

  def self.send_text_message
    #DATABASERECORDS
    #View.display
    #TWILIO
    account_sid = 'ACf3e3cedbc8f67dbbd7437a67e8297082'
    auth_token = '5251a57a7f7b6f997e6bb01b41024bc9'
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.account.messages.create(:body => "Jenny please?! I love you <3",
        :to => "+17075145821",
        :from => "+17075145821",
        :media_url => "http://www.example.com/hearts.png")
    puts message.to


  end
end



Run.send_text_message




class View

    def self.display
      p date
      p
      p POD
    #DATABASERECORDS
    end
end