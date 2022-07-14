# 02_cher_depute.rb

require 'nokogiri'

require 'open-uri'

page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique")) 

scrap_all_depute_url = page.xpath('//*[@id="deputes-list"]/*/*/*/a')
all_depute_href = []
scrap_all_depute_url.each do |depute_url_href|
  all_depute_href.push(depute_url_href['href'])
end 

all_depute_url = all_depute_href.map {|href| "https://www2.assemblee-nationale.fr" + href}

all_depute_mail = []
all_depute_url.each do |url|
  depute_page = Nokogiri::HTML(URI.open("#{url}"))
  scrap_depute_mail = depute_page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a')
  all_depute_mail.push(scrap_depute_mail.text)
end 

all_depute_complete_name = all_depute_mail.map(&:clone)
all_depute_complete_name.join(" ").gsub('@assemblee-nationale.fr', '').gsub('.', ' ').split

all_depute_first_name = []
all_depute_complete_name.each do |name|
  all_depute_first_name.push(all_depute_complete_name.split.first)
end 

all_depute_last_name = []
all_depute_complete_name.each do |name|
  all_depute_first_name.push(all_depute_complete_name.split.last)
end 


