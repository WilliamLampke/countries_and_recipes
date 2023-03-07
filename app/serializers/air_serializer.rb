class AirSerializer
    include JSONAPI::Serializer
    attributes :aqi, :datetime, :readable_aqi
    

  end
  