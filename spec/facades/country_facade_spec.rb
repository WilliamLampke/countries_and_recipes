require 'rails_helper'

RSpec.describe "Country Facade" do
    it "finds a random country" do
        json_response = File.read('spec/fixtures/countries.json')
        stub_request(:get, "https://restcountries.com/v3.1/all")
            .to_return(status: 200, body: json_response, headers: {})

        countries = CountryFacade.get_countries
        expect(countries.first.name).to eq("Gambia")
    end
    it "finds coordinates by country name" do
        json_response = File.read('spec/fixtures/france_country.json')
        country = "France"
        stub_request(:get, "https://restcountries.com/v3.1/name/France")
            .to_return(status: 200, body: json_response, headers: {})

        capital = CountryFacade.get_coordinates(country)
        expect(capital.capital).to eq("Paris")
        expect(capital.coords).to eq([2.33, 48.87])
    end

end