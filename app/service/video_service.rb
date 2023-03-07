class VideoService
    def self.get_video(country)
        response = conn.get("?q=#{country}")
        data = JSON.parse(response.body, symbolize_names: true)
    end

    def self.conn
        Faraday.new(url: 'https://www.googleapis.com/youtube/v3/search') do |faraday|
            faraday.params["key"] = "AIzaSyCB4BskO4tW7C-pivwgUaSeLSUgO3XVe7o"
            faraday.params["part"] = "snippet"
            faraday.params["channel_id"] = "UCluQ5yInbeAkkeCndNnUhpw"
        end
    end
end