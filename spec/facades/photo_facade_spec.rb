require 'rails_helper'

RSpec.describe "Photo Facade" do
    it "finds photos based on a given country" do
        json_response2 = File.read('spec/fixtures/french_photos.json')
        stub_request(:get, "https://api.unsplash.com/search/photos?client_id=0VSQm7HhiUi_g16im9LH4Baojh9wkNX_h93yCjGBtFQ&page=1&per_page=3&query=France")
            .to_return(status: 200, body: json_response2, headers: {})
        pics = PhotoFacade.get_pics("France")
        expect(pics.length).to eq(3)
        expect(pics[0].alt_tag).to eq("bike leaning against handrail in front of concrete building at daytime")
        expect(pics[1].alt_tag).to eq("low-angle photography of Eiffel Tower, Paris")
        expect(pics[2].alt_tag).to eq("group of people walking near body of water and building under blue sky at daytime")
    end
end