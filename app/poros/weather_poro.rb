class WeatherPoro
  attr_reader :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(params)
    @current_weather = instantiator(params[:current], CurrentPoro)
    @daily_weather = instantiator(params[:daily], DailyPoro)
    @hourly_weather = instantiator(params[:hourly], HourlyPoro)
    binding.pry
  end

  def instantiator(params, object)
    attributes = {}
    params.map do |param|
      param.each do |p|
        attributes[:conditions] = item[:description]
        attributes[:icon] = item[:icon]
      end
      object.new(param.merge(attributes))
    end
  end

  # def gen_current_weather(params)
  #   {
  #     datetime: = params[:dt],
  #     sunrise: = params[:sunrise],
  #     sunset: = params[:sunset],
  #     temperature: = params[:temp],
  #     feels_like: = params[:feels_like],
  #     humidity: = params[:humidity],
  #     uvi: = params[:uvi],
  #     visibility: = params[:visibility],
  #     conditions_and_icons(params[:weather])
  #   }
  # end

  # def conditions_and_icons(params)
  #   current_weather = {}
  #   params.each do |attribute|
  #     current_weather[:conditions] = attribute[:description]
  #     current_weather[:icon] = attribute[:icon]
  #   end
  # end

end
