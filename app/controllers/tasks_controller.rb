class TasksController < ApplicationController
  def index
    @user=User.find(session[:id])
    @tasks=Task.where("user_id=?", @user.id)
  end

  def show
    @task=Task.find(params[:id])
  end

  def new
    @task = Task.new
 
  end

  def create

    @task = Task.new(task_params)
    @task.user_id = session[:id]
    if @task.save
      redirect_to tasks_path
    else
      render plain: "error"
    end
  end

  def edit
    @user = User.find(session[:id])
  end

  def update
    @task = Task.new()
  end

  def destroy
  end

  private

      def task_params
        params.require(:task).permit(:content, :completion, :due_date)
      end
end
