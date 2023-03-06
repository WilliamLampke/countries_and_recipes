class PlaceSerializer
    include JSONAPI::Serializer
    attributes :name, :address, :place_id
  end
  