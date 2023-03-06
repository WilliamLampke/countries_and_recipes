class TourismFacade
    def self.get_places(coords)
      data = TourismService.get_places(coords)
      data[:features].map {|place| Place.new(place)}
    end
  end