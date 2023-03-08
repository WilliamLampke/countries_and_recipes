class PhotoService
    def self.get_pics(country)
      response = conn.get("?query=#{country}")
      data = JSON.parse(response.body, symbolize_names: true)
    end
    def self.conn
        Faraday.new(url: 'https://api.unsplash.com/search/photos') do |faraday|
          faraday.params["client_id"] = '0VSQm7HhiUi_g16im9LH4Baojh9wkNX_h93yCjGBtFQ'
          faraday.params["page"] = "1"
          faraday.params["per_page"] = "3"
        end
      end
end