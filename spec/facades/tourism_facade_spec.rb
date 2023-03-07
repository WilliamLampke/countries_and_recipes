require 'rails_helper'

RSpec.describe "Tourism Facade" do
    it "returns tourist attractions based on coordinates" do
        json_response = File.read('spec/fixtures/paris_response.json')
        coords = [2.33, 48.87]
        stub_request(:get, "https://api.geoapify.com/v2/places?apiKey=343522680ecc4fdfbc5ed15a75acebbe&categories=tourism&filter=circle:2.33,48.87,1000")
            .to_return(status: 200, body: json_response, headers: {})
        
        places = TourismFacade.get_places(coords)
        expect(places.first.name).to eq("Palais du Louvre")
        expect(places.first.address).to eq("Louvre Palace, Avenue du Général Lemonnier, 75001 Paris, France")
        expect(places.first.place_id).to eq("518d1bce0ed2af02405927f526f2356e4840f00101f90159c731000000000092031050616c616973206475204c6f75767265")
    end
end