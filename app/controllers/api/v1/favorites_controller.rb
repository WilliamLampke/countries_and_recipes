class Api::V1::FavoritesController < ApplicationController
    def index 
        user = User.where(api_key: params[:api_key])
        if user.length > 0 
            favorites =  Favorite.where(user_id: user[0].id)
            render json: FavoriteSerializer.new(favorites)
        else 
            render json: { unsuccessful: "User not found"}, status: 404 
        end
    end


    def create 
    user = User.where(api_key: params[:api_key])
        if user.length > 0 
            Favorite.create!(country: params[:country], recipe_link: params[:recipe_link], recipe_title: params[:recipe_title], user_id: user[0].id)
            render json: { success: "Favorite added successfully"}, status: 201
        else
            render json: { unsuccessful: "User not found"}, status: 404  
        end
    end
end