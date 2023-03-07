class Api::V1::LearningResourcesController < ApplicationController
    def index
        videos = VideoService.get_video("France")
    end
end