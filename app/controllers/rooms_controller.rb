class RoomsController < ApplicationController

  before_action :require_user, only: [:show, :index]  ## вообще не пойму как это тут работает...
  # но пока она просто не пускает неавторизованных пользователей на методы комнаты...



  def index
    #@room = Room.all
  end

  def show
    #@room = Room.find(params[:id])
    #@photos = @room.photos
  end
end
