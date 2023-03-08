require 'rails_helper'

RSpec.describe "User api" do
    it 'can make a user and generate a random api key' do

        post "/api/v1/users?name=william&email=william@gmail.com"
        expect(response).to be_successful
        user = JSON.parse(response.body, symbolize_names: true)
        expect(user[:data]).to have_key(:id)
        expect(user[:data]).to have_key(:type)
        expect(user[:data][:attributes]).to have_key(:name)
        expect(user[:data][:attributes]).to have_key(:email)
        expect(user[:data][:attributes]).to have_key(:api_key)

        post "/api/v1/users?name=william&email=william@gmail.com"
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to eq({:errors=>"Email already exists"})

    end

end