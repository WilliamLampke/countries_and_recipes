require 'rails_helper'

RSpec.describe "Country Facade" do
    it "finds a random country" do
        
        
        json_response = File.read('spec/fixtures/countries.json')
        stub_request(:get, "https://restcountries.com/v3.1/all")
            .to_return(status: 200, body: json_response, headers: {})

   
        countries = CountryFacade.get_countries
        expect(countries.first.name).to eq("Gambia")
        expect(countries.last.name).to eq("British Indian Ocean Territory")
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
    it 'can find a singular countries with more info' do
        json_response = File.read('spec/fixtures/france_country.json')
        stub_request(:get, "https://restcountries.com/v3.1/name/France")
            .to_return(status: 200, body: json_response, headers: {})

        #photo reequest
        json_response2 = File.read('spec/fixtures/french_photos.json')
        stub_request(:get, "https://api.unsplash.com/search/photos?client_id=0VSQm7HhiUi_g16im9LH4Baojh9wkNX_h93yCjGBtFQ&page=1&per_page=3&query=France")
            .to_return(status: 200, body: json_response2, headers: {})
        #video request
        json_response3 = File.read('spec/fixtures/video_response.json')
        stub_request(:get, "https://www.googleapis.com/youtube/v3/search?key=AIzaSyCB4BskO4tW7C-pivwgUaSeLSUgO3XVe7o&part=snippet&q=France&channel_id=UCluQ5yInbeAkkeCndNnUhpw")
            .to_return(status: 200, body: json_response3, headers: {})
    
        country_info = CountryFacade.single_country("France")
        
        expect(country_info.name).to eq("France")
        expect(country_info.id).to eq(nil)
        expect(country_info.type).to eq("learning_resource")
        expect(country_info.images.length).to eq(3)
        expect(country_info.video[:title]).to eq("A Super Quick History of France")
    end
end