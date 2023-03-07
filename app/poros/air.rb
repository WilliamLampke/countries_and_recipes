class Air 
    attr_reader :id, :type, :aqi, :datetime, :readable_aqi
    def initialize(data) 
        @id = nil 
        @type = "air_quality"
        @aqi = data[:list][0][:main][:aqi]
        @datetime = data[:list][0][:dt]
        @readable_aqi = readable(data[:list][0][:main][:aqi])
    end
    def readable(aqi)
        if aqi == 1
            "Good"
        elsif aqi == 2
            "Fair"
        elsif aqi == 3
            "Moderate"
        elsif aqi == 4
            "Poor"
        elsif aqi == 5
            "Very Poor"
        end
    end
end