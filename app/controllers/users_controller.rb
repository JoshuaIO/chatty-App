class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  def index
    @users = User.all
  end
  def show
#    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new,status: :unprocessable_entity
    end
  end

  def edit
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :description)
    end
    def set_user
      @user = User.find(params[:id])
    end
end
