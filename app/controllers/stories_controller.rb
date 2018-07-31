class StoriesController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy, :sort]
  # before_action :set_story, only: [:show, :edit, :update, :destroy, :sort]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all.order(:position)
    @sprints = Sprint.all

  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    set_story
  end

  # GET /stories/new
  def new
    @story = Story.new
    @sprints = Sprint.all
  end

  # GET /stories/1/edit
  def edit
    set_story
    @sprints = Sprint.all
  end

  def sort
    params[:story].each_with_index do |id, index|
     Story.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    set_story
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    set_story
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_story
    @story = Story.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:name, :description, :label, :complete, :position, :sort, :sprint_id)
    end
end
