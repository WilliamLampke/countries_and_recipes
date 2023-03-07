class Api::V1::RecipesController < ApplicationController
    def index 
        if params[:country] == nil
            countries = CountryFacade.get_countries
            recipes = RecipeFacade.get_recipes(countries.sample.name)
            render json: RecipeSerializer.new(recipes)
        else
            recipes = RecipeFacade.get_recipes(params[:country])
            render json: RecipeSerializer.new(recipes)
        end
    end
end