# 01_mairie_christmas_spec.rb

require_relative '../lib/01_mairie_christmas'

describe "get_townhall_name" do
  it "return an array of all city name" do
    expect(get_townhall_name(scrap_all_link_commune)).not_to be_nil
  end
end
