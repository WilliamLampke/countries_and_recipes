require 'rails_helper'

RSpec.describe "Air Facade" do
    it "returns air quality based on coordinates" do
        json_response = File.read('spec/fixtures/air_response.json')
        coords = [2.33, 48.87]
        stub_request(:get, "http://api.openweathermap.org/data/2.5/air_pollution?apiKey=8af6b49a56c3bace6181819f7e3602b4&lat=48.87&lon=2.33")
            .to_return(status: 200, body: json_response, headers: {})
        
        air_info = AirFacade.get_air(coords)
        expect(air_info.id).to eq(nil)
        expect(air_info.type).to eq("air_quality")
        expect(air_info.aqi).to eq(2)
        expect(air_info.datetime).to eq(1678206352)
        expect(air_info.readable_aqi).to eq("Fair")
    end
end