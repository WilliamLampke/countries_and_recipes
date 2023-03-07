class Api::V1::TouristSightsController < ApplicationController
    def index 
      capital = CountryFacade.get_coordinates(params[:country])
      places = TourismFacade.get_places(capital.coords)
      render json: PlaceSerializer.new(places)
    end
end