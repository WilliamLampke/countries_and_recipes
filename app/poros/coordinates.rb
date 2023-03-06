class Coordinates
    attr_reader :capital, :coords
    def initialize(data)
        @capital = data[0][:capital][0]
        @coords = data[0][:capitalInfo][:latlng].reverse
    end
end