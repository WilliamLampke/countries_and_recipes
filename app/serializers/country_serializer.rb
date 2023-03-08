class CountrySerializer
  include JSONAPI::Serializer
  attributes :name, :images, :video
end
