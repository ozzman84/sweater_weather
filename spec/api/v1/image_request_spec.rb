require 'rails_helper'

describe 'Image request', :vcr do
  describe 'valid request' do
    describe 'valid location' do
      let(:location) { 'denver,co' }
      before { get '/api/v1/backgrounds', params: { location: location } }

      it 'response is successful' do
        expect(response).to be_successful
      end

      it 'returns valid response body' do
        expect(json).to be_a Hash
        expect(json[:data]).to be_a Hash
        expect(json[:data][:id]).to be nil
        expect(json[:data][:type]).to eq 'image'
        expect(json[:data][:attributes]).to be_a Hash

        expect(json[:data][:attributes][:author]).to be_a String
        expect(json[:data][:attributes][:image_url]).to be_a String
        expect(json[:data][:attributes][:location]).to eq location
      end
    end
  end
end
