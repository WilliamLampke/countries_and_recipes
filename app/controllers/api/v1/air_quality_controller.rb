class Api::V1::AirQualityController < ApplicationController
    def index 
        capital = CountryFacade.get_coordinates(params[:country])
        air_info = AirFacade.get_air(capital.coords)
        render json: AirSerializer.new(air_info)
    end
end