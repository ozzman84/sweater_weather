class UsersSerializer
  include JSONAPI::Serializer
  attributes :email, :api_key

  # def custom_serialize(user)
  #   {
  #     "data": {
  #       "type": "users",
  #       "id": null,
  #       "attributes": {
  #         "email": user.email,
  #         "api_key": user.api_key
  #       }
  #     }
  #   }
  # end
end
