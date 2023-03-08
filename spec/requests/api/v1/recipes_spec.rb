require 'rails_helper'
RSpec.describe "Recipe API" do
    it "finds recipes based on country passed" do
        json_response = File.read('spec/fixtures/recipes_response.json')
        stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=c3d11ac0&app_key=00a56245260473399c7357d04f0482c0&q=France&type=public")
            .to_return(status: 200, body: json_response, headers: {})

        # json_response2 = File.read('spec/fixtures/france_country.json')
        # stub_request(:get, "https://restcountries.com/v3.1/name/France")
        #     .to_return(status: 200, body: json_response2, headers: {})
        
        get "/api/v1/recipes?country=France"
        expect(response).to be_successful
        recipes = JSON.parse(response.body, symbolize_names: true)
        expect(recipes[:data].count).to eq(20)

        recipes[:data].each do |recipe|
            expect(recipe).to have_key(:id)
            expect(recipe).to have_key(:type)

            expect(recipe[:attributes]).to have_key(:title)
            expect(recipe[:attributes]).to have_key(:url)
            expect(recipe[:attributes]).to have_key(:country)
            expect(recipe[:attributes]).to have_key(:image)
        end
    end
end