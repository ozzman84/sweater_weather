require 'rails_helper'

describe 'Road Trip Request' do
  describe 'Create' do
    describe 'valid params' do
      let(:valid_params) { {
        origin: 'Denver,CO',
        destination: 'Pueblo,CO',
        api_key: 'jgn983hy48thw9begh98h4539h4'
        }
      }
      before { post '/api/v1/road_trip', params: valid_params }

      it 'can successfully create RoadTrip' do
        expect(response).to be_successful
      end

      it 'returns a valid response format' do
        expect(json).to be_a Hash
        expect(json[:data]).to be_a Hash
        expect(json[:data][:id]).to be nil
        expect(json[:data][:type]).to eq 'roadtrip'
        expect(json[:data][:attributes]).to be_a Hash

        expect(json[:data][:attributes][:start_city]).to be_a String
        expect(json[:data][:attributes][:end_city]).to be_a String
        expect(json[:data][:attributes][:travel_time]).to be_a String

        expect(json[:data][:attributes][:weather_at_eta]).to be_a Hash
        expect(json[:data][:attributes][:weather_at_eta][:temperature]).to be_a Float
        expect(json[:data][:attributes][:weather_at_eta][:conditions]).to be_a String
      end
    end
    #
    # describe 'valid params' do
    #   let(:valid_params) { {
    #     origin: 'NewYork,NY',
    #     destination: 'London,UK',
    #     api_key: 'jgn983hy48thw9begh98h4539h4'
    #     }
    #   }
    #   before { post '/api/v1/road_trip', params: valid_params }
    #
    #   it 'can successfully create RoadTrip' do
    #     expect(response).to be_successful
    #   end
    #
    #   it 'returns a valid response format' do
    #     expect(json).to be_a Hash
    #     expect(json[:data]).to be_a Hash
    #     expect(json[:data][:id]).to be nil
    #     expect(json[:data][:type]).to eq 'roadtrip'
    #     expect(json[:data][:attributes]).to be_a Hash
    #
    #     expect(json[:data][:attributes][:start_city]).to be_a String
    #     expect(json[:data][:attributes][:end_city]).to be_a String
    #     expect(json[:data][:attributes][:travel_time]).to be_a String
    #
    #     expect(json[:data][:attributes][:weather_at_eta]).to be_a Hash
    #     expect(json[:data][:attributes][:weather_at_eta][:temperature]).to be_a Float
    #     expect(json[:data][:attributes][:weather_at_eta][:conditions]).to be_a String
    #   end
    # end
  end
end
