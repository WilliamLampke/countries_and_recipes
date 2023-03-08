class Api::V1::UsersController < ApplicationController
    def create 
        user = User.new(name: params[:name], email: params[:email])
        if user.save    
            user.update(api_key: SecureRandom.base64)
            user.save
            render json: UserSerializer.new(user), status: 201
        else
            render json: {errors: "Email already exists"}, status: 404
        end
    end
end