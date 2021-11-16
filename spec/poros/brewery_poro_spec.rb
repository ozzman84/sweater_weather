require 'rails_helper'

RSpec.describe 'BreweryPoro' do
  before :each do
    @brew_hash = {
      :id=>"10-barrel-brewing-co-denver-denver",
      :name=>"10 Barrel Brewing Co - Denver",
      :brewery_type=>"large",
      :street=>"2620 Walnut St",
      :address_2=>nil,
      :address_3=>nil,
      :city=>"Denver",
      :state=>"Colorado",
      :county_province=>nil,
      :postal_code=>"80205-2231",
      :country=>"United States",
      :longitude=>"-104.9853655",
      :latitude=>"39.7592508",
      :phone=>"7205738992",
      :website_url=>nil,
      :updated_at=>"2021-10-23T02:24:55.243Z",
      :created_at=>"2021-10-23T02:24:55.243Z"
    }
    @brewery = BreweryPoro.new(@brew_hash)
  end

    it 'exists & has attributes' do
      expect(@brewery).to be_a(BreweryPoro)
      expect(@brewery.id).to eq('10-barrel-brewing-co-denver-denver')
      expect(@brewery.type).to eq('large')
      expect(@brewery.name).to eq('10 Barrel Brewing Co - Denver')
    end
  end
