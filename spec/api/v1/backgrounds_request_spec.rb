require 'rails_helper'

describe 'Backgrounds Request' do
  describe 'valid location' do
    let(:location) { 'denver,co' }
    # before { get '/api/vi/backgrounds', params: {location: 'denver,co' } }

    it 'response is successful' do
      # get(api_v1_backgrounds(location: "denver,co"))
      get '/api/vi/backgrounds?location=denver,co'
      # get '/api/vi/backgrounds', params: {location: 'denver,co'}

      expect(response).to be_successful
    end
  end
end
