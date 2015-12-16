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




  def room_params
    params.require(@room).permit(:id)

  end
end


##----------------------------------------------------------------------------------##

##def show
 ## @user  = User.find(params[:id])
 ## @games = Game.find(:all, :conditions => ['user1_id = ? or user2_id = ?', @user.id, @user.id])

##end

