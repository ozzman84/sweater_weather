require 'rails_helper'

RSpec.describe 'Forecast Request' do
  describe 'Index' do
    describe 'a valid city/state' do
      before { get '/api/v1/forecast?location=denver,co' }

      it 'returns weather data w/attributes' do
        expect(response).to be_successful
      end
    end
  end
end
