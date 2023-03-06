
class CountryService
    def self.get_countries
        response = conn.get("all")
        data = JSON.parse(response.body, symbolize_names: true)
    end
    def self.get_coordinates(country)
        response = conn.get("/name/#{country}")
        data = JSON.parse(response.body, symbolize_names: true)
    end
    def self.conn
            Faraday.new(url: 'https://restcountries.com/v3.1') do |faraday|

        end
    end
end