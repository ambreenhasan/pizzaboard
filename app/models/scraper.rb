require 'nokogiri'
require 'open-uri'

class Grab_Pizza_Info
  attr_reader :week_data

  def self.scrape_cb_site
    doc = Nokogiri::HTML(open('http://www.cheeseboardcollective.coop/pizza'))

    date_tues = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[2]').text
    pod_tues = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[1]').text

    date_wed = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[3]').text
    pod_wed = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[2]').text

    date_thurs = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[4]').text
    pod_thurs = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[3]').text

    date_fri = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[5]').text
    pod_fri = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[4]').text.gsub!("Ã¨", "e")

    date_sat = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[6]').text
    pod_sat = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[5]').text

   @week_data = [[pod_tues,date_tues],[pod_wed,date_wed],[pod_thurs,date_thurs],[pod_fri,date_fri],[pod_sat,date_sat]]

  end
end

Grab_Pizza_Info.scrape_cb_site
