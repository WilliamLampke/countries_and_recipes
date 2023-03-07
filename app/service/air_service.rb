class AirService
    def self.get_air(coords)
      response = conn.get("?lat=#{coords[1]}&lon=#{coords[0]}")
      data = JSON.parse(response.body, symbolize_names: true)
    end
    def self.conn
        Faraday.new(url: 'http://api.openweathermap.org/data/2.5/air_pollution') do |faraday|
          faraday.params["apiKey"] = '8af6b49a56c3bace6181819f7e3602b4'
        end
      end
end