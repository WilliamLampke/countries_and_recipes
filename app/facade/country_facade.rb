class CountryFacade
    def self.get_countries
      data = CountryService.get_countries
      data.map {|country| Country.new(country)}
    end
    def self.get_coordinates(country)
      data = CountryService.get_coordinates(country)
      Coordinates.new(data)
    end
  end