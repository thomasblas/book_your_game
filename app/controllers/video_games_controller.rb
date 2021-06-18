class VideoGamesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @video_games = policy_scope(VideoGame).order(created_at: :desc)
    @video_games = VideoGame.search_by_title_plateform_category(params[:query]) if params[:query].present?
set_joystick
  end

  def show
    set_joystick
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

   def set_joystick
    @joysticks = {  "PS1" => "https://res.cloudinary.com/thomaspointnet/image/upload/v1624017215/manette_playstation_g2pcrz.png",
                    "PS2" => "https://res.cloudinary.com/thomaspointnet/image/upload/v1624017215/manette_playstation_g2pcrz.png",
                    "PS3" => "https://res.cloudinary.com/thomaspointnet/image/upload/v1624017215/manette_playstation_g2pcrz.png",
                    "PS4" => "https://res.cloudinary.com/thomaspointnet/image/upload/v1624017215/manette_playstation_g2pcrz.png",
                    "PS5" => "https://res.cloudinary.com/thomaspointnet/image/upload/v1624017215/manette_playstation_g2pcrz.png",
                    "Xbox" => "https://res.cloudinary.com/thomaspointnet/image/upload/v1624017215/manette_xbox_igortk.png",
                    "Xbox one" => "https://res.cloudinary.com/thomaspointnet/image/upload/v1624017215/manette_xbox_igortk.png",
                    "Dreamcast" => "https://res.cloudinary.com/thomaspointnet/image/upload/v1624017215/manette_dreamcast_lk74to.png",
                    "Nintendo 64" => "https://res.cloudinary.com/thomaspointnet/image/upload/v1624017652/manette_64_w5leow.png",
                    "Super nintendo" => "https://res.cloudinary.com/thomaspointnet/image/upload/v1624017652/manette_super_nes_cz6q62.png",
                    "unknown" => "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Atari-2600-Joystick.jpg/1200px-Atari-2600-Joystick.jpg",
                    "PC" => "https://res.cloudinary.com/thomaspointnet/image/upload/v1624017827/souris_cipt2p.png",
                    "Game boy" => "https://res.cloudinary.com/thomaspointnet/image/upload/v1624017215/manette_gameboy_kwxru1.png",
                    "Game Boy" => "https://res.cloudinary.com/thomaspointnet/image/upload/v1624017215/manette_gameboy_kwxru1.png",
                    "Megadrive" => "https://res.cloudinary.com/thomaspointnet/image/upload/v1624017652/manette_megadrive_wlubyw.png",
                    "Nes" => "https://res.cloudinary.com/thomaspointnet/image/upload/v1624017652/manette_nes_kyqrxe.png"
                  }
  end
end
