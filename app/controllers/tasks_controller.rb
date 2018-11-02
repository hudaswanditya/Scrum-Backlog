class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

      # RestClient.get('https://api.github.com/?access_token=')
      body = {
        :title => @task.name,
        :body => @task.details,
        labels: [
          @task.story,
          @task.status
        ]
      }
      url = 'https://api.github.com/repos/hudaswanditya/Scrum-Backlog/issues?access_token='
      token = ''
      RestClient.post url + token, body.to_json

      redirect_to @task, notice: 'Task was successfully created.'

    # respond_to do |format|
    #   if @task.save
    #     format.html { redirect_to @task, notice: 'Task was successfully created.' }
    #     format.json { render :show, status: :created, location: @task }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @task.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    #PATCH github
    # respond_to do |format|
    #   if @task.update(task_params)
    #     format.html { redirect_to @task, notice: 'Task was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @task }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @task.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    puts issue
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :details, :story, :status)
    end
end
