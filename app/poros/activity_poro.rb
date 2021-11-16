class ActivityPoro
  attr_reader :title,
              :type,
              :participants,
              :price

  def initialize(params)
    @title = params[:activity]
    @type = params[:type]
    @participants = params[:participants]
    @price = params[:price]
  end
end
