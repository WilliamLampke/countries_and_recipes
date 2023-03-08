require 'rails_helper' 

RSpec.describe "Favorites API" do
    it "shows a user and their favorite recipes" do
    test_user = User.create!(name: "test", email: "test@gmail.com", api_key: "fake")
    
    recipe1 = Favorite.create!(country: "thailand", recipe_link: "https://www.tastingtable.com/.....", recipe_title: "Crab Fried Rice (Khaao Pad Bpu)", user_id: test_user.id) 
    recipe2 = Favorite.create!(country: "thailand", recipe_link: "https://www.tastingtable.com/.....", recipe_title: "Crab Fried Rice (Khaao Pad Bpu)", user_id: test_user.id) 
    recipe3 = Favorite.create!(country: "thailand", recipe_link: "https://www.tastingtable.com/.....", recipe_title: "Crab Fried Rice (Khaao Pad Bpu)", user_id: test_user.id) 
    
    get "/api/v1/favorites?api_key=fake"
    expect(response).to be_successful
    favorites = JSON.parse(response.body, symbolize_names: true)
    expect(favorites[:data].length).to eq(3)
    expect(favorites[:data][0]).to have_key(:id)
    expect(favorites[:data][0]).to have_key(:type)
    
    expect(favorites[:data][0][:attributes]).to have_key(:country)
    expect(favorites[:data][0][:attributes]).to have_key(:recipe_link)
    expect(favorites[:data][0][:attributes]).to have_key(:recipe_title)
    end 

    describe "favorites post", :type => :request do
        it 'can save a recipe to a user' do
            test_user = User.create!(name: "test2", email: "test2@gmail.com", api_key: "fake2")

            params = {
                api_key: "fake2",
                country: "thailand",
                recipe_link: "https://www.tastingtable.com/.....",
                recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
            }
            post "/api/v1/favorites?api_key=fake2&country=thailand&recipe_link=https://www.tastingtable.com/.....&recipe_title=Crab Fried Rice (Khaao Pad Bpu)"
            
            expect(response).to be_successful
            json = JSON.parse(response.body, symbolize_names: true)
            expect(json).to eq({:success=>"Favorite added successfully"})
        end
    end
end