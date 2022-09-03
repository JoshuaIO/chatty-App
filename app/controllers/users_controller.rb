class UsersController < ApplicationController
  def index
    @user = User.all
  end
  def show
#    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :description)
    end
    def set_user
      @user = User.find(params[:id])
    end
end
