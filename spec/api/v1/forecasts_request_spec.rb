require 'rails_helper'

RSpec.describe 'Forecast Request', :vcr do
  describe 'Index' do
    describe 'a valid city/state' do
      before { get '/api/v1/forecast?location=denver,co' }

      it 'returns weather data w/attributes' do
        expect(response).to be_successful
      end

      it 'returns valid format' do
        expect(json).to be_a Hash
        expect(json[:data]).to be_a Hash
        expect(json[:data][:id]).to be nil
        expect(json[:data][:type]).to eq 'forecast'

        expect(json[:data][:attributes][:current_weather]).to be_a Hash
        expect(json[:data][:attributes][:current_weather][:datetime]).to be_a String
        expect(json[:data][:attributes][:current_weather][:sunrise]).to be_a String
        expect(json[:data][:attributes][:current_weather][:sunset]).to be_a String
        expect(json[:data][:attributes][:current_weather][:temperature]).to be_a Float
        expect(json[:data][:attributes][:current_weather][:feels_like]).to be_a Float
        expect(json[:data][:attributes][:current_weather][:humidity]).to be_a Integer
        
        expect(json[:data][:attributes][:current_weather][:uvi]).to be_a Integer
        expect(json[:data][:attributes][:current_weather][:visibility]).to be_a Integer
        expect(json[:data][:attributes][:current_weather][:conditions]).to be_a String
        expect(json[:data][:attributes][:current_weather][:icon]).to be_a String

        expect(json[:data][:attributes][:daily_weather]).to be_an Array
        expect(json[:data][:attributes][:daily_weather][0][:date]).to be_a String
        expect(json[:data][:attributes][:daily_weather][0][:sunrise]).to be_a String
        expect(json[:data][:attributes][:daily_weather][0][:sunset]).to be_a String
        expect(json[:data][:attributes][:daily_weather][0][:max_temp]).to be_a Float
        expect(json[:data][:attributes][:daily_weather][0][:min_temp]).to be_a Float
        expect(json[:data][:attributes][:daily_weather][0][:conditions]).to be_a String
        expect(json[:data][:attributes][:daily_weather][0][:icon]).to be_a String

        expect(json[:data][:attributes][:hourly_weather]).to be_an Array
        expect(json[:data][:attributes][:hourly_weather][0][:time]).to be_a String
        expect(json[:data][:attributes][:hourly_weather][0][:temperature]).to be_a Float
        expect(json[:data][:attributes][:hourly_weather][0][:conditions]).to be_a String
        expect(json[:data][:attributes][:hourly_weather][0][:icon]).to be_a String
      end
    end
  end
end
