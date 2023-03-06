class Recipe
    attr_reader :id, :type, :attributes, :title, :url, :country, :image
    def initialize(data, country)
        @id = nil
        @type = "recipe"
        @title = data[:recipe][:label]
        @url = data[:recipe][:url]
        @country = country
        @image = data[:recipe][:image]
    end
end