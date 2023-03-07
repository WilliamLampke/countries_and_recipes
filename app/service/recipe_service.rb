class RecipeService
    def self.get_recipes(country)
      response = conn.get("?q=#{country}")
      data = JSON.parse(response.body, symbolize_names: true)
    end
    def self.conn
        Faraday.new(url: 'https://api.edamam.com/api/recipes/v2') do |faraday|
          faraday.params["app_key"] = '00a56245260473399c7357d04f0482c0'
          faraday.params["app_id"] = 'c3d11ac0'
          faraday.params["type"] = 'public'
        end
      end
end