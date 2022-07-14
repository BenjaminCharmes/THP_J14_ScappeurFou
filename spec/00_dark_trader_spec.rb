# 00_dark_trader_spec.rb

require_relative '../lib/00_dark_trader'

describe "crypto" do

  it "return an hash of all crypto with their prices" do
    expect(crypto(scrapper)).to be_an(Hash)
  end

  it "return the name of crypto" do  
    expect(crypto(scrapper)).to include ("BTC")
    expect(crypto(scrapper)).to include ("ETH")
    expect(crypto(scrapper)).to include ("USDT")
  end 

end
