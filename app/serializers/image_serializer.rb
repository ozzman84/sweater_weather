class ImageSerializer
  include JSONAPI::Serializer
  attributes :name, :image_url, :location
end
