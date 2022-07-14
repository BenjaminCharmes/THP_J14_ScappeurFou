# 01_mairie_christmas.rb

require 'nokogiri'

require 'open-uri'

# Error open-uri: lib/00_dark_trader.rb:8: warning: calling URI.open via Kernel#open is deprecated, call URI.open directly or use URI#open

def scrapper
  return page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html")) 
end

def get_townhall_url(page)

  print "Récupération des liens de la page de chaque commune ... "

  # Récuperer les liens de la page de chaque mairie
  scrap_all_link_commune = page.xpath('//a[@class="lientxt"]')
  all_email_link_href = []
  scrap_all_link_commune.each do |email_link_href|
    all_email_link_href.push(email_link_href['href'])
  end 

  # Le mettre sous forme de liens 
  all_email_link = all_email_link_href.map {|href| "http://annuaire-des-mairies.com" + href[1..-1]}

  puts "Terminé."

  return all_email_link

end

def get_townhall_name(scrap_all_link_commune)

  # Récuperer un array des noms des villes
  all_commune_adress_name = []
  scrap_all_link_commune.each do |commune_name|
    all_commune_adress_name.push(commune_name)
  end 

  all_commune_name = all_commune_adress_name.map {|name| name.gsub('http://annuaire-des-mairies.com/95/', '')}.map {|name| name.gsub('.html', '')}

  return all_commune_name

end  

def get_townhall_email(all_email_link)

  print "Récupération des adresses mails de chaque mairie ... "

  # Récuperer l'adresse mail sur chaque page de chaque mairie
  all_email_commune = []
  all_email_link.each do |email_link|
    email_page = Nokogiri::HTML(URI.open("#{email_link}"))
    scrap_all_email_commune = email_page.xpath('//section[2]/div/table/tbody/tr[4]/td[2]')
    all_email_commune.push(scrap_all_email_commune)
  end 

  all_email_commune_text = []

  all_email_commune.each do |email_link_text|
    all_email_commune_text.push(email_link_text.text)
  end

  puts "Terminé."

return all_email_commune_text

end 

def perform
  all_email_link = get_townhall_url(scrapper)
  all_commune_name = get_townhall_name(all_email_link)
  all_email_commune_text = get_townhall_email(all_email_link)
  # Hash avec [nom_de_la_ville, adresse_mail]
  puts "Voici la liste des adresses mails de la mairie de chaque commune du département du Val-d'Oise: "
  a = Hash[all_commune_name.zip all_email_commune_text]
  print a
end 

perform