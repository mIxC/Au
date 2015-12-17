class RoomsController < ApplicationController
  include UsersHelper

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.create(first_user: current_user)
    redirect_to '/game/' + @room.id.to_s
  end

  def show
    @room = Room.find_by_id(params[:id])
    @room.second_user = current_user
    @room.save
  end



end

##----------------------------------------------------------------------------------##


