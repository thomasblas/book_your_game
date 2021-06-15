class VideoGamesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @video_games = VideoGame.all
    @video_games = policy_scope(VideoGame).order(created_at: :desc)
  end

  def show
    id = params[:id]
    @video_game = VideoGame.find(id)
    authorize @video_game
  end

  def new
    @video_game = VideoGame.new
  end

  def create
    video_game = VideoGame.new(video_game_params)
    if video_game.save
      redirect_to video_game_path(video_game)
    else
      render :new
    end
  end

  def edit
    id = params[:id]
    @video_game = VideoGame.find(id)
  end

  def update
    id = params[:id]
    @video_game = VideoGame.find(id)
    @video_game.update(video_game_params)
    redirect_to video_game_path(@video_game)
  end

  def destroy
    id = params[:id]
    video_game = VideoGame.find(id)
    # user_id = video_game.user_id
    video_game.destroy
    redirect_to root_path
  end

  private

  def video_game_params
    params.require(:video_game).permit(:title, :plateform, :price, :photo, :category, :available, :user_id)
  end
end
