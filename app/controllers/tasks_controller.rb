class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end


  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:name, :start_at, :end_at, :all_day, :note))
    if @task.save
      redirect_to tasks_url, notice: "タスク「#{@task.name}」を登録しました"
    else
      render "new"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:name, :start_at, :end_at, :all_day, :note))
      flash[:notice] = "「#{@task.name}」を更新しました"
      redirect_to :tasks
    else
      render "edit"
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク#{task.name}を削除しました"
  end
end
