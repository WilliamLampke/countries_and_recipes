class Api::V1::RecipesController < ApplicationController
    def index 
        if params[:country] == nil
            countries = CountryFacade.get_countries
            recipes = RecipeFacade.get_recipes(countries.sample.name)
        else
            recipes = RecipeFacade.get_recipes(params[:country])
        end
    end
end