class BackgroundsFacade
  class << self
    def get_background(location)
      response = BackgroundsService.find_background(location)
    end
  end
end
