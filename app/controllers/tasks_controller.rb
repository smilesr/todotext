class TasksController < ApplicationController
  def index
    @user=User.find(1)
    @tasks=Task.where("user_id=?", @user.id)
  end

  def show
    @task=Task.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
