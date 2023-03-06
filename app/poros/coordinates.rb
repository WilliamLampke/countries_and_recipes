class Coordinates
    def initialize(data)
        @capital = data[0][:capital]
        @coords = data[0][:capitalInfo][:latlng]
    end
end