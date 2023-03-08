class VideoFacade 
    def self.get_video(country)
        video = VideoService.get_video(country)
        Video.new(video[:items][0])
    end
end