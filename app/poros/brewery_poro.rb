class BreweryPoro
  attr_reader :id,
              :type,
              :name

  def initialize(params)
    @id = params[:id]
    @type = params[:brewery_type]
    @name = params[:name]
  end
end
