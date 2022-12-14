class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
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
  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    @user.destroy
    redirect_to root_path, status: :see_other
  end
  private
    def user_params
      params.require(:user).permit(:username, :password, :description)
    end
    def set_user
      @user = User.find(params[:id])
    end
end
