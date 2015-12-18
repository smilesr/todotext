class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    # binding.pry
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to tasks_path
      return
    else
      flash.now[:danger] = "Invalid email and/or password"
      render :create
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
