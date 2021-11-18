require 'rails_helper'

RSpec.describe 'BreweriesService', :vcr do
  describe 'Find Breweries', :vcr do
    let(:weather) { {
      :data=>
        {:id=>nil,
         :type=>"forecast",
         :attributes=>
          {:current_weather=>
            {:datetime=>"2021-11-16 17:43:34 UTC",
             :sunrise=>"2021-11-16 13:46:09 UTC",
             :sunset=>"2021-11-16 23:43:41 UTC",
             :temperature=>66.02,
             :feels_like=>63.3,
             :humidity=>21,
             :uvi=>1.96,
             :visibility=>10000,
             :conditions=>"overcast clouds",
             :icon=>"04d"},
           :daily_weather=>
            [{:date=>"2021-11-16", :sunrise=>"2021-11-16 13:46:09 UTC", :sunset=>"2021-11-16 23:43:41 UTC", :max_temp=>67.28, :min_temp=>46.8, :conditions=>"overcast clouds", :icon=>"04d"},
             {:date=>"2021-11-17", :sunrise=>"2021-11-17 13:47:17 UTC", :sunset=>"2021-11-17 23:42:57 UTC", :max_temp=>42.98, :min_temp=>34.63, :conditions=>"broken clouds", :icon=>"04d"},
             {:date=>"2021-11-18", :sunrise=>"2021-11-18 13:48:26 UTC", :sunset=>"2021-11-18 23:42:16 UTC", :max_temp=>49.24, :min_temp=>32.27, :conditions=>"clear sky", :icon=>"01d"},
             {:date=>"2021-11-19", :sunrise=>"2021-11-19 13:49:34 UTC", :sunset=>"2021-11-19 23:41:36 UTC", :max_temp=>61.65, :min_temp=>43.93, :conditions=>"overcast clouds", :icon=>"04d"},
             {:date=>"2021-11-20", :sunrise=>"2021-11-20 13:50:41 UTC", :sunset=>"2021-11-20 23:40:58 UTC", :max_temp=>58.75, :min_temp=>44.8, :conditions=>"overcast clouds", :icon=>"04d"},
             {:date=>"2021-11-21", :sunrise=>"2021-11-21 13:51:48 UTC", :sunset=>"2021-11-21 23:40:22 UTC", :max_temp=>58.89, :min_temp=>30.79, :conditions=>"broken clouds", :icon=>"04d"},
             {:date=>"2021-11-22", :sunrise=>"2021-11-22 13:52:55 UTC", :sunset=>"2021-11-22 23:39:48 UTC", :max_temp=>50.13, :min_temp=>28.85, :conditions=>"clear sky", :icon=>"01d"},
             {:date=>"2021-11-23", :sunrise=>"2021-11-23 13:54:01 UTC", :sunset=>"2021-11-23 23:39:16 UTC", :max_temp=>56.93, :min_temp=>43.25, :conditions=>"light rain", :icon=>"10d"}],
           :hourly_weather=>
            [{:time=>"2021-11-16 17:00:00 UTC", :temperature=>64.99, :conditions=>"overcast clouds", :icon=>"04d"},
             {:time=>"2021-11-16 18:00:00 UTC", :temperature=>66.02, :conditions=>"overcast clouds", :icon=>"04d"},
             {:time=>"2021-11-17 12:00:00 UTC", :temperature=>34.86, :conditions=>"few clouds", :icon=>"02n"},
             {:time=>"2021-11-17 13:00:00 UTC", :temperature=>34.63, :conditions=>"broken clouds", :icon=>"04n"},
             {:time=>"2021-11-17 14:00:00 UTC", :temperature=>34.84, :conditions=>"overcast clouds", :icon=>"04d"},
             {:time=>"2021-11-17 15:00:00 UTC", :temperature=>35.4, :conditions=>"overcast clouds", :icon=>"04d"},
             {:time=>"2021-11-17 18:00:00 UTC", :temperature=>38.39, :conditions=>"broken clouds", :icon=>"04d"},
             {:time=>"2021-11-17 19:00:00 UTC", :temperature=>39.52, :conditions=>"clear sky", :icon=>"01d"},
             {:time=>"2021-11-17 20:00:00 UTC", :temperature=>40.8, :conditions=>"clear sky", :icon=>"01d"},
             {:time=>"2021-11-17 21:00:00 UTC", :temperature=>41.61, :conditions=>"clear sky", :icon=>"01d"},
             {:time=>"2021-11-18 16:00:00 UTC", :temperature=>36.86, :conditions=>"clear sky", :icon=>"01d"}]}}}}
    let(:params) { { location: 'denver,co', quantity: 5} }
    let(:breweries) { BreweriesService.find_brewereies(weather, params) }

    it 'returns formed data' do
      expect(breweries[:data]).to be_a Hash
      expect(breweries[:data][:id]).to be nil
      expect(breweries[:data][:type]).to be_a String
      expect(breweries[:data][:type]).to eq "breweries"
      expect(breweries[:data][:attributes]).to be_a Hash

      expect(breweries[:data][:attributes][:destination]).to be_a String
      expect(breweries[:data][:attributes][:destination]).to eq params[:location]

      expect(breweries[:data][:attributes][:forecast]).to be_a Hash
      expect(breweries[:data][:attributes][:forecast][:summary]).to be_a String
      expect(breweries[:data][:attributes][:forecast][:temperature]).to be_a String

      expect(breweries[:data][:attributes][:breweries]).to be_an Array
      # expect(breweries[:data][:attributes][:breweries]).to eq []
    end
  end
end
