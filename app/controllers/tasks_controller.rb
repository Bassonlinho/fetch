class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :destroy]
  before_action :authenticate_user!,only: [:index,:show]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.email_check(current_user) 
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    respond_to do |format|    
      format.js        
      format.html
    end
  end

  # GET /tasks/new
  def new
    @task = Task.new

    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /tasks/1/edit
  def edit
  end

  # PUT /tasks/1/update
  def update
    @task = Task.find(params[:task_id])
    @task.completed = !@task.completed
    @task.save
    respond_to do |format|
      format.html {redirect_to tasks_path}
      format.js
      format.json {render json: @task}
    end
  end


  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to root_path}
        format.json { render :show, status: :created, location: @task }
        format.js 
      else
        format.html { render :new, flash[:notice] = 'ERROR: TASK WAS NOT CREATED!' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.js   {}
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:url, :words, :email, :completed)
    end


  end
