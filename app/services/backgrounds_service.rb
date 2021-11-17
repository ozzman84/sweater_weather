class BackgroundsService
  class << self
    def find_background(location)
      city = location.split(',')[-2].strip
      response = BackgroundsClient.request_background("/search/photos?query=#{city}")
    end
  end
end
