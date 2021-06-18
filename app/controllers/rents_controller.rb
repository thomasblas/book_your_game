class RentsController < ApplicationController
  skip_after_action :verify_authorized, only: [:create]
  skip_before_action :authenticate_user!, only: [:create]

  def create
    rent = Rent.new(rent_params)
    rent.state = "Pending"
    authorize rent
    if rent.save
      redirect_to controller: 'pages', action: 'home', new_rent: true
    else
      redirect_to root_path
    end
  end

  def accept
    rent = Rent.find(params[:id])
    authorize rent
    rent.video_game.update(available: false)
    rent.update(state: "Accepted")
    redirect_to dashboard_path
  end

  def decline
    rent = Rent.find(params[:id])
    authorize rent
    rent.destroy
    redirect_to dashboard_path
  end

  private

  def rent_params
    params.require(:rent).permit(:video_game_id, :user_id, :rent_start_at, :rent_end_at)
  end
end
