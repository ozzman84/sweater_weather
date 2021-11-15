class CurrentPoro
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :conditions,
              :icon

  def initialize(params)
    @datetime = params[:dt]
    @sunrise = params[:sunrise]
    @sunset = params[:sunset]
    @temperature = params[:temp]
    @feels_like = params[:feels_like]
    @humidity = params[:humidity]
    @uvi = params[:uvi]
    @visibility = params[:visibility]
    @conditions = params[:conditions]
    @icon = params[:icon]
  end
end
