class PhotoFacade
    def self.get_pics(country)
      data = PhotoService.get_pics(country)
      data[:results].map {|pic| Picture.new(pic)}
    end
  end