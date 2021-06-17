class VideoGamesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    if params[:query].present?
      @video_games = VideoGame.search_by_title_plateform_category(params[:query])
    else
      @video_games = VideoGame.all
    end
      @video_games = policy_scope(VideoGame).order(created_at: :desc)
  end

  def show
    id = params[:id]
    @video_game = VideoGame.find(id)
    authorize @video_game
  end

  def new
    @video_game = VideoGame.new
    authorize @video_game
  end

  def create
    video_game = VideoGame.new(video_game_params)
    video_game.user = current_user
    video_game.available = true
    authorize video_game
    if video_game.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    id = params[:id]
    @video_game = VideoGame.find(id)
    authorize @video_game
  end

  def update
    id = params[:id]
    @video_game = VideoGame.find(id)
    authorize @video_game
    @video_game.update(video_game_params)
    redirect_to dashboard_path
  end

  def destroy
    id = params[:id]
    video_game = VideoGame.find(id)
    authorize video_game
    # user_id = video_game.user_id
    video_game.destroy
    redirect_to dashboard_path
  end

  private

  def video_game_params
    params.require(:video_game).permit(:title, :plateform, :price, :photo, :category, :available, :user_id)
  end
end
