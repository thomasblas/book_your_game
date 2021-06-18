class DashboardController < ApplicationController
  after_action :verify_authorized, except: [:show]

  def show
    set_joystick
    @games = current_user.video_games
    @rents = Rent.where(user: current_user).where(state: "Accepted")
    tmp = current_user.video_games.map { |vg| vg.id }
    @pending_rents = Rent.where(video_game_id: tmp).where(state: "Pending")
    # raise
  end

  private

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
