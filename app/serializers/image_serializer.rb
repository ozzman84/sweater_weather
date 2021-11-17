class ImageSerializer

  def serialize(response, location)
    {
      "data": {
        "type": "image",
        "id": null,
        "attributes": {
          "location": location,
          "image_url": response[:urls][:full],
          "author": response[:user][:name]
        }
      }
    }
  end
end
