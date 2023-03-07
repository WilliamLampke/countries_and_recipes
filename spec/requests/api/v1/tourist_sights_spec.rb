require 'rails_helper'
RSpec.describe "Places API" do
    it "finds tourism sights in a capital based on country passed" do
        json_response = File.read('spec/fixtures/paris_response.json')
        stub_request(:get, "https://api.geoapify.com/v2/places?filter=circle2.33,48.87,1000")
            .to_return(status: 200, body: json_response, headers: {})

        json_response2 = File.read('spec/fixtures/france_country.json')
        stub_request(:get, "https://restcountries.com/name/France")
            .to_return(status: 200, body: json_response2, headers: {})
        
        get "/api/v1/tourist_sights?country=France"
        expect(response).to be_successful
        places = JSON.parse(response.body, symbolize_names: true)
        
        expect(places[:data].count).to eq(20)

        places[:data].each do |place|
            expect(place).to have_key(:id)
            expect(place).to have_key(:type)

            expect(place[:attributes]).to have_key(:name)
            expect(place[:attributes]).to have_key(:address)
            expect(place[:attributes]).to have_key(:name)
        end
    end
end