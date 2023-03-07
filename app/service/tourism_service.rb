class TourismService
    def self.get_places(coords)
      response = conn.get("?filter=circle:#{coords[0]},#{coords[1]},1000")
      data = JSON.parse(response.body, symbolize_names: true)
    end
    def self.conn
        Faraday.new(url: 'https://api.geoapify.com/v2/places') do |faraday|
          faraday.params["apiKey"] = '343522680ecc4fdfbc5ed15a75acebbe'
          faraday.params["categories"] = 'tourism'
        end
      end
end