require 'rails_helper'

RSpec.describe 'Breweries Requests', :vcr do
  describe 'successful request' do
    describe 'Breweries quantity by city/state' do
      # before { get '/api/v1/breweries?location=denver,co&quantity=5' }

      it 'has a successful response' do
        get '/api/v1/breweries?location=denver,co&quantity=5'

        expect(response).to be_successful
        breweries = JSON.parse(response.body, symbolize_names: true)

        expect(breweries[:data]).to be_a Hash
        expect(breweries[:data][:id]).to be nil
        expect(breweries[:data][:type]).to be_a String
        expect(breweries[:data][:type]).to eq 'breweries'
        expect(breweries[:data][:attributes]).to be_a Hash

        expect(breweries[:data][:attributes][:destination]).to be_a String
        expect(breweries[:data][:attributes][:destination]).to eq 'denver,co'

        expect(breweries[:data][:attributes][:forecast]).to be_a Hash
        expect(breweries[:data][:attributes][:forecast][:summary]).to be_a String
        expect(breweries[:data][:attributes][:forecast][:temperature]).to be_a String

        expect(breweries[:data][:attributes][:breweries]).to be_an Array
      end
    end
  end
end
