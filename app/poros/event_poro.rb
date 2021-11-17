class EventPoro
  attr_reader :id,
              :destination,
              :forecast,
              :summary,
              :temperature,
              :activities

  def initialize(params)
    @id = params[:id]
    @destination = params[:attributes][:destination]
    @summary = params[:attributes][:forecast][:summary]
    @temperature = params[:attributes][:forecast][:temperature]
    @activities = gen_activities(params[:attributes][:activities])
  end

  def gen_activities(params)
    params.map do |activity|
      ActivityPoro.new(activity)
    end
  end
end
