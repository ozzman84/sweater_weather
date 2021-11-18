require 'rails_helper'

RSpec.describe 'Open Weather Facade' do
  describe 'receives valid Service Response', :vcr do
    let(:weather) { WeatherFacade.get_weather('denver,co') }

    it 'current_weather is formed correctly' do
      expect(weather).to be_a Hash

      expect(weather[:current]).to be_a Hash
      expect(weather[:current][:dt]).to be_a Integer
      expect(weather[:current][:sunrise]).to be_a Integer
      expect(weather[:current][:sunset]).to be_a Integer
      expect(weather[:current][:temp]).to be_a Float
      expect(weather[:current][:feels_like]).to be_a Float
      expect(weather[:current][:humidity]).to be_a Integer
      expect(weather[:current][:uvi]).to be_a Integer
      expect(weather[:current][:visibility]).to be_a Integer

      expect(weather[:current][:weather]).to be_an Array
      expect(weather[:current][:weather][0][:description]).to be_a String
      expect(weather[:current][:weather][0][:icon]).to be_a String

      expect(weather[:daily]).to be_an Array
      expect(weather[:daily][0][:dt]).to be_a Integer
      expect(weather[:daily][0][:sunrise]).to be_a Integer
      expect(weather[:daily][0][:sunset]).to be_a Integer
      expect(weather[:daily][0][:temp][:max]).to be_a Float
      expect(weather[:daily][0][:temp][:min]).to be_a Float
      expect(weather[:daily][0][:weather][0][:description]).to be_a String
      expect(weather[:daily][0][:weather][0][:icon]).to be_a String

      expect(weather[:hourly]).to be_an Array
      expect(weather[:hourly][0][:dt]).to be_a Integer
      expect(weather[:hourly][0][:temp]).to be_a Float
      expect(weather[:hourly][0][:weather][0][:description]).to be_a String
      expect(weather[:hourly][0][:weather][0][:icon]).to be_a String
    end
  end
end
