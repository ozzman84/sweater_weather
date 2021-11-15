class HourlyPoro
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(params)
    @time = params[:dt]
    @temperature = params[:temp]
    @conditions = params[:conditions]
    @icon = params[:icon]
  end
end
