class UsersController < ApplicationController

  before_action :current_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/profile'   ### не переходит чего-то... отправляет на главную!
    else
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find_by_user_name(params[:id])
  end



  private
    def user_params
      params.require(:user).permit(:user_name, :password)

    end

end
