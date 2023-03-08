class Country
  attr_reader :id, :type, :name, :images, :video

  def initialize(country)
    @id = nil
    @type = "learning_resource"
    @name = country[:name][:common]
    @images = get_images(country[:name][:common])
    @video = get_vid(country[:name][:common])
  end

  def get_images(name)
    pics = PhotoFacade.get_pics(name)
    pics.map do |pic|
      {
        :alt_tag => pic.alt_tag,
        :url => pic.url
      }
    end
  end
  def get_vid(name)
    vid_info = VideoFacade.get_video(name)
    {
      :title => vid_info.title,
      :youtube_video_id => vid_info.youtube_video_id
    }
  end
end
