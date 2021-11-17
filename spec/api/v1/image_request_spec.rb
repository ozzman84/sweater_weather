require 'rails_helper'

describe 'Image request' do
  describe 'valid request' do
    describe 'valid location' do
      let(:location) { 'denvr,co' }
      before { get '/api/v1/backgrounds', params: { location: location } }

      it 'response is successful' do
        expect(reponse).to be_successful
      end

      it 'returns valid response body' do
        expect(json).to be_a Hash
        expect(json[:data]).to be_a Hash
        expect(json[:data][:id]).to be nil
        expect(json[:data][:type]).to eq 'image'

        expect(json[:data][:attributes]).to be_a Hash
        expect(json[:data][:attributes][:name]).to be_a Hash
        expect(json[:data][:attributes][:urls][:image]).to be_a Hash
      end
    end
  end
end
