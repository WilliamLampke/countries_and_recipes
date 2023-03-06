require 'rails_helper'

RSpec.describe "Recipe Facade" do
    it "finds a recipe by country" do
        json_response = File.read('spec/fixtures/recipes_response.json')
        country = "France"
        stub_request(:get, "https://api.edamam.com/api/recipes/v2?q=France")
            .to_return(status: 200, body: json_response, headers: {})

        recipes = RecipeFacade.get_recipes(country)
        
        expect(recipes[0].country).to eq("France")
    end
end