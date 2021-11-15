require 'rails_helper'

RSpec.describe OpenWeatherClient do
  describe 'expect' do
    {
     :dt=>1636912800,
     :sunrise=>1636897431,
     :sunset=>1636933514,
     :moonrise=>1636926720,
     :moonset=>1636880400,
     :moon_phase=>0.36,
     :temp=>{:day=>289.22, :min=>277.25, :max=>292.68, :night=>285.97, :eve=>289.41, :morn=>277.27},
     :feels_like=>{:day=>287.4, :night=>284.22, :eve=>287.85, :morn=>274.96},
     :pressure=>1015,
     :humidity=>20,
     :dew_point=>266.37,
     :wind_speed=>5.9,
     :wind_deg=>284,
     :wind_gust=>14.99,
     :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}],
     :clouds=>13,
     :pop=>0,
     :uvi=>2.67
    }

    current_weather_result = {:datetime=>1636948946,
 :sunrise=>1636897431,
 :sunset=>1636933514,
 :temperature=>57.38,
 :feels_like=>54.52,
 :humidity=>36,
 :uvi=>0,
 :visibility=>10000,
 :conditions=>"clear sky",
 :icon=>"01n"}

    it ''
  end
end
