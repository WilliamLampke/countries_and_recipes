class AirFacade
    def self.get_air(coords)
      data = AirService.get_air(coords)
      Air.new(data)
    end
  end