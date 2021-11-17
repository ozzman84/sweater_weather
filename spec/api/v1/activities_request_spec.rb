require 'rails_helper'

RSpec.describe 'Activities Request' do
  describe 'Index' do
    describe 'Valide City/state' do
      before { get '/api/v1/activities?destination=chicago,il' }

      it 'returns a success response' do
        expect(response).to be_successful
      end
    end
  end
end
