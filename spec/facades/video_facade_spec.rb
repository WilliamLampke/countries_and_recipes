require 'rails_helper'

RSpec.describe "Video Facade" do
    it "finds video based on a given country" do
        json_response3 = File.read('spec/fixtures/video_response.json')
        stub_request(:get, "https://www.googleapis.com/youtube/v3/search?key=AIzaSyCB4BskO4tW7C-pivwgUaSeLSUgO3XVe7o&part=snippet&q=France&channel_id=UCluQ5yInbeAkkeCndNnUhpw")
            .to_return(status: 200, body: json_response3, headers: {})
        video = VideoFacade.get_video("France")
        expect(video.title).to eq("A Super Quick History of France")
        expect(video.youtube_video_id).to eq("I22A32uBvRo")
    end
end