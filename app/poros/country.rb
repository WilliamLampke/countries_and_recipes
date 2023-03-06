class Country
  attr_reader :name, :images

  def initialize(country)
    @name = country[:name][:common]
    @images = images(country[:flags])
  end

  def images(data)
        {
        :png => data[:png],
        :svg => data[:svg],
        :alt => data[:alt]
        }
    
  end
end
