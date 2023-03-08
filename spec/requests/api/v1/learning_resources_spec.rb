require 'rails_helper'
RSpec.describe "Country API" do
    it "find info pics and a video based on country passed" do
        json_response = File.read('spec/fixtures/france_country.json')
        stub_request(:get, "https://restcountries.com/v3.1/name/France")
            .to_return(status: 200, body: json_response, headers: {})

        #photo request
        json_response2 = File.read('spec/fixtures/french_photos.json')
        stub_request(:get, "https://api.unsplash.com/search/photos?client_id=0VSQm7HhiUi_g16im9LH4Baojh9wkNX_h93yCjGBtFQ&page=1&per_page=3&query=France")
            .to_return(status: 200, body: json_response2, headers: {})
        #video request
        json_response3 = File.read('spec/fixtures/video_response.json')
        stub_request(:get, "https://www.googleapis.com/youtube/v3/search?key=AIzaSyCB4BskO4tW7C-pivwgUaSeLSUgO3XVe7o&part=snippet&q=France&channel_id=UCluQ5yInbeAkkeCndNnUhpw")
            .to_return(status: 200, body: json_response3, headers: {})
            
        get "/api/v1/learning_resources?country=France"
        expect(response).to be_successful
        country_info = JSON.parse(response.body, symbolize_names: true)
        
            expect(country_info[:data]).to have_key(:id)
            expect(country_info[:data]).to have_key(:type)

            expect(country_info[:data][:attributes]).to have_key(:name)
            expect(country_info[:data][:attributes]).to have_key(:images)
            expect(country_info[:data][:attributes][:images][0]).to have_key(:alt_tag)
            expect(country_info[:data][:attributes][:images][0]).to have_key(:url)
            expect(country_info[:data][:attributes]).to have_key(:video)
            expect(country_info[:data][:attributes][:video]).to have_key(:title)
            expect(country_info[:data][:attributes][:video]).to have_key(:youtube_video_id)
    end
end