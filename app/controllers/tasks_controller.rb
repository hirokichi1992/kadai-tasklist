class TasksController < ApplicationController
  before_action :set_task, only:[:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end
  def new
    @task = Task.new
  end
  def show
    #@task = Task.find(params[:id])
  end
  def edit
    #@task = Task.find(params[:id])
  end
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "タスクが追加されました"
      redirect_to @task
    else
      flash.now[:danger] = "タスクが追加されませんでした"
      render :new
    end
  end
  def update
    #@task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "タスクが修正されました"
      redirect_to @task
    else
      flash.now[:danger] = "タスクが修正されませんでした"
      render :edit
    end
  end
  def destroy
    #@task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "タスクが完了しました！お疲れ様でした！"
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  #strong parameter
  def task_params
    params.require(:task).permit(:content,:status)
  end
  
end
