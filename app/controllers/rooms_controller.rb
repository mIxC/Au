class RoomsController < ApplicationController
  include UsersHelper

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params[:room])
    ###@room = Room.new(room_params)
    @room.first_user = current_user.user_name

    if @room.save
      redirect_to '/game'
    end
  end




  def show
    
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

