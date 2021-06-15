class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @video_games = VideoGame.all
    @homepage_video_games = @video_games.sample(3)
  end
end
