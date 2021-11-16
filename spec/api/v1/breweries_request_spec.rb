require 'rails_helper'

RSpec.describe 'Breweries Requests' do
  describe 'successful request' do
    describe 'Breweries quantity by city/state' do
      before { get '/api/v1/breweries?location=denver,co&quantity=5' }

      it 'has a successful response' do
        expect(response).to be_successful
      end
    end
  end
end
