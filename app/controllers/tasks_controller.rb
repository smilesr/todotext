class TasksController < ApplicationController
  def index
    # binding.pry
    @user=User.find(session[:user_id])
    @tasks=Task.where("user_id=?", @user.id)
    render
  end

  def show
    @task=Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create

    @task = Task.new(task_params)
    @task.user_id = session[:user_id]
    if @task.save
      redirect_to tasks_path
    else
      render plain: "error"
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
   # @user = User.find(session[:id])
   # @task = Task.update_attributes(completed: params[:completed]
  end


  def destroy
    @user = User.find(session[:user_id])
    @task = @user.tasks.find(params[:id])

    @task.destroy
   
    respond_to do |format|
      format.js {render inline: "location.reload();" }
      format.html { redirect_to tasks_path }
      format.json { head :no_content }
   #  format.js   { render :layout => false }
    end
  end


  private

      def task_params
        params.require(:task).permit(:content, :completion, :due_date)
      end
end
