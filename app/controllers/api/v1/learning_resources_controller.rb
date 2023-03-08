class Api::V1::LearningResourcesController < ApplicationController
    def index

        country_info = CountryFacade.single_country(params[:country])
        render json: CountrySerializer.new(country_info)
        
    end
end