# 00_dark_trader.rb

require 'json'

require 'nokogiri'

require 'open-uri'

# Error open-uri: lib/00_dark_trader.rb:8: warning: calling URI.open via Kernel#open is deprecated, call URI.open directly or use URI#open
#def get_all_crypto_symbol


def scrapper
  return page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all'))
end

def fusiontab(tab1,tab2)
  return Hash[tab1.zip(tab2)]
end

def crypto(page)
  array_name=[]
  array_value=[]
  name_of_crypto=page.xpath('//tr//td[3]')
  value_of_crypto=page.xpath('//tr//td[5]')
  hash={}
  name_of_crypto.each{ |name|
      array_name<<name.text
  }
  value_of_crypto.each{|price|
  array_value << price.text
  }
  hash=fusiontab(array_name,array_value)
  return hash
end

puts crypto(scrapper)