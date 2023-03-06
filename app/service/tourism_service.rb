class TourismService
    def self.get_places(coords)
      response = conn.get("?filter=circle#{coords[0]},#{coords[1]},1000")
      data = JSON.parse(response.body, symbolize_names: true)
    end
    def self.conn
        Faraday.new(url: 'https://api.geoapify.com/v2/places') do |faraday|
          faraday.headers["app_key"] = ENV['00a56245260473399c7357d04f0482c0']
        end
      end
end