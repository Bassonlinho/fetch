class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :destroy,:update,:active,:inactive]
  before_action :authenticate_user!,only: [:index,:show]
  before_action :restrict_home_page, only:[:new]

  respond_to :js, :html
  
  def index
    @tasks = Task.match_email(current_user)
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
    respond_to do |format| 
      if current_user.email == @task.email
        format.js        
        format.html
      else
        format.html {redirect_to tasks_path, notice: 'You cant access this page!'}
      end
    end
  end


  def new
    @task = Task.new

    respond_to do |format|
      format.js
      format.html
    end
  end


  def edit
  end

  def active
    @task.active!
    respond_to do |format|
      format.html {redirect_to tasks_path,notice: 'Your task is now active!'}
      format.json {render json: @task}
      format.js
    end
  end

  def inactive
    @task.inactive!
    respond_to do |format|
      format.html {redirect_to tasks_path,notice: 'Your task is now inactive!'}
      format.json {render json: @task}
      format.js
    end
  end


  def update
    @task.update(task_params)
    respond_to do |format|
      format.html {redirect_to tasks_path,notice: 'Task successfully updated!'}
      format.js
      format.json {render json: @task}
    end
  end


  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.js   {}
        format.html { redirect_to root_path, notice: 'Task was successfully created!'}
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, flash[:notice] = 'ERROR: TASK WAS NOT CREATED!' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.js   {}
      end
    end
  end


  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
      format.js {}
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def restrict_home_page
    redirect_to(tasks_path) if current_user
  end

  def task_params
    params.require(:task).permit(:url, :words, :email, :status)
  end


end
