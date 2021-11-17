class DailyPoro
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp

  def initialize(params)
    @date = params[:date]
    @sunrise = params[:sunrise]
    @sunset = params[:sunset]
    @max_temp = params[:temp][:max]
    @min_temp = params[:temp][:min]
    @conditions = params[:conditions]
    @icon = params[:icon]
  end
end
