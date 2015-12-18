class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      if @user.tasks.first.nil?
        redirect_to new_task_path
        # render "tasks/new"
        return
      else
        render :new
        return
      end
    else
      render :new
      #error message
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      ###
    else
      render :edit
      ##error message
    end

  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
  end

  private

    def user_params
      params.require(:user).permit(:username,:email,:password,:password_confirmation)
    end

end
