class DashboardController < ApplicationController
  after_action :verify_authorized, except: [:show]
  def show
    @games = current_user.video_games
    @rents = current_user.rents
    # raise
  end
end
