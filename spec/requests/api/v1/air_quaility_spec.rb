require 'rails_helper'
RSpec.describe "Air API" do
    it "finds air quality in a capital based on country passed" do
        json_response = File.read('spec/fixtures/air_response.json')
        stub_request(:get, "http://api.openweathermap.org/data/2.5/air_pollution?apiKey=8af6b49a56c3bace6181819f7e3602b4&lat=48.87&lon=2.33")
            .to_return(status: 200, body: json_response, headers: {})

        json_response2 = File.read('spec/fixtures/france_country.json')
        stub_request(:get, "https://restcountries.com/v3.1/name/France")
            .to_return(status: 200, body: json_response2, headers: {})
        
        get "/api/v1/air_quality?country=France"
        expect(response).to be_successful
        air_info = JSON.parse(response.body, symbolize_names: true)
       
            expect(air_info[:data]).to have_key(:id)
            expect(air_info[:data]).to have_key(:type)

            expect(air_info[:data][:attributes]).to have_key(:aqi)
            expect(air_info[:data][:attributes]).to have_key(:datetime)
            expect(air_info[:data][:attributes]).to have_key(:readable_aqi)
    end
end