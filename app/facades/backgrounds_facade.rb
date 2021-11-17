class BackgroundsFacade
  class << self
    def get_background(location)
      response = BackgroundsService.find_background(location)
      image_selector(response)
    end

    private

    def image_selector(response)
      response[:results][0]
    end
  end
end