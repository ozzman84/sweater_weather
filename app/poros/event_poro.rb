class EventPoro
  attr_reader :id,
              :destination,
              :forecast,
              :summary,
              :temperature,
              :activites

  def initialize(params)
    @id = params[:id]
    @destination = params[:attributes][:destination]
    @forecast = params[:attributes][:forecast]
    @summary = params[:][:summary]
    @temperature = params[:temperature]
    @activites = gen_activities(params[:activites])
  end

  def gen_activities(params)
    params.map do |activity|
      ActivityPoro.new(activity)
    end
  end
end
