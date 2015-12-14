class RoomsController < ApplicationController

  def new
    @room = Room.new

  end

  def create
    @room = Room.new(:first_user => current_user.user_name)

      @room.save
    redirect_to '/game'
  end

  ### что-то типа удаление,  ( прсото флажек законченности игры)
  def destroy
    @room.ending = TRUE
  end

  def show
    @room = Room.find_by_first_user(current_user.user_name)  ### создает и перенаправляет в конату для игры блеать!
  end

####  надо проверить,  написал наугад,  коннект второго пользователя
  ########## к игре где есть первый пользователь  ( в качестве параметра передается имя первого пользователя)
  def connect
    @room = Room.find_by_first_user(params)
    @room.second_user = current_user.user_name
    redirect_to '/game'
  end


end
