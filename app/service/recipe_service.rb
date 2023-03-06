class RecipeService
    def self.get_recipes(country)
      response = conn.get("?q=#{country}")
      data = JSON.parse(response.body, symbolize_names: true)
    end
    def self.conn
        Faraday.new(url: 'https://api.edamam.com/api/recipes/v2') do |faraday|
          faraday.headers["app_key"] = ENV['00a56245260473399c7357d04f0482c0']
          faraday.headers["app_id"] = ENV['c3d11ac0']
          faraday.headers["type"] = ENV['public']
        end
      end
end