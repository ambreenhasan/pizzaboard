require 'nokogiri'
require 'open-uri'

class Grab_Pizza_Info
  attr_reader :week_data

  def scrape_cb_site
    doc = Nokogiri::HTML(open('http://www.cheeseboardcollective.coop/pizza'))

    date_tues = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[2]')
    pod_tues = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[1]')

    date_wed = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[3]')
    pod_wed = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[2]')

    date_thurs = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[4]')
    pod_thurs = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[3]')

    date_fri = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[5]')
    pod_fri = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[4]')

    date_sat = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[6]')
    pod_sat = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[5]')

    @week_data = [[pod_tues,date_tues],[pod_weds,date_wed],[pod_thurs,date_thurs],[pod_fri,date_fri],[pod_sat,date_sat]]

  end