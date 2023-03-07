require 'rails_helper'

RSpec.describe "Recipe Facade" do
    it "finds a recipe by country" do
        json_response = File.read('spec/fixtures/recipes_response.json')
        country = "France"
        stub_request(:get,  "https://api.edamam.com/api/recipes/v2?app_id=c3d11ac0&app_key=00a56245260473399c7357d04f0482c0&q=France&type=public")
            .to_return(status: 200, body: json_response, headers: {})

        recipes = RecipeFacade.get_recipes(country)
        
        expect(recipes[0].country).to eq("France")
    end
end