class DashboardController < ApplicationController
  after_action :verify_authorized, except: [:show]
  def show
    @games = current_user.video_games
    @rents = Rent.where(user: current_user).where(state: "Accepted")
    tmp = current_user.video_games.map { |vg| vg.id }
    @pending_rents = Rent.where(video_game_id: tmp).where(state: "Pending")
    # raise
  end
end
