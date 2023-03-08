class CountryFacade
    def self.get_countries
      data = CountryService.get_countries
      data.map {|country| AllCountries.new(country)}
    end
    def self.get_coordinates(country)
      data = CountryService.get_coordinates(country)
      Coordinates.new(data)
    end
    def self.single_country(country)
      data = CountryService.single_country(country)
      Country.new(data[0])
    end
  end