require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.cheeseboardcollective.coop/pizza'))

p date_tuesday = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[2]')
p pod_tuesday = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[1]')
"================="
p date_wednesdapy = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[3]')
p pod_wednesday = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[2]')
"================="
p date_thursday = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[4]')
p pod_thursday = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[3]')
"================="
p date_friday = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[5]')
p pod_friday = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[4]')
"================="
p date_saturday = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[6]')
p pod_saturday = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[5]')



# P.O.D. = date, details


#body > div > div.columns > div:nth-child(1) > p:nth-child(4)


# //*[@id="body"]/div/div[2]/div[1]/h4[2]

# //*[@id="body"]/div/div[2]/div[1]/p[1]
