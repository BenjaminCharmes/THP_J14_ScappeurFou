# 01_mairie_christmas_spec.rb

require_relative '../lib/01_mairie_christmas'

describe "Mairie Christmas !" do

  it "return an hash of all townhall with their mail" do
    expect(perform).to be_an(Hash)
  end

  it "return the name of townhall" do  
    expect(perform).to include ("ableiges")
    expect(perform).to include ("avernes")
    expect(perform).to include ("wy-dit-joli-village")
  end 

end