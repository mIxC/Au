class RoomsController < ApplicationController

  before_action :require_user, only: [:index, :show]

  def index
    #@room = Room.all
  end

  def show
    #@room = Room.find(params[:id])
    #@photos = @room.photos
  end
end
