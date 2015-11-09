class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # render plain: params[:user].inspect
    @user = User.new(user_params)
    if @user.save
     render "tasks/index"
    else 
     render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find

  end

  def destroy
  end

  private

    def user_params
      params.require(:user).permit(:username,:email,:password,:password_confirmation)
    end

end
