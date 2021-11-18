class ImageSerializer

  def self.custom_serialize(response, location)
    {
      "data": {
        "type": "image",
        "id": nil,
        "attributes": {
          "location": location,
          "image_url": response[:urls][:full],
          "author": response[:user][:name]
        }
      }
    }
  end
end
