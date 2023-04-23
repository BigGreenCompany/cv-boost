class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /experiences or /experiences.json
  def index
    @experiences = current_user.experiences.all
  end

  # GET /experiences/1 or /experiences/1.json
  def show
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
  end

  # GET /experiences/1/edit
  def edit
  end

  # POST /experiences or /experiences.json
  def create
    @experience = current_user.experiences.new(experience_params)

    respond_to do |format|
      if @experience.save
        format.html { redirect_to experience_url(@experience), notice: "Experience was successfully created." }
        format.json { render :show, status: :created, location: @experience }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experiences/1 or /experiences/1.json
  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to experience_url(@experience), notice: "Experience was successfully updated." }
        format.json { render :show, status: :ok, location: @experience }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiences/1 or /experiences/1.json
  def destroy
    @experience.destroy

    respond_to do |format|
      format.html { redirect_to experiences_url, notice: "Experience was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_experience
    @experience = current_user.experiences.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:place, :title, :started_at, :ended_at, :location, :description, :category)
  end
end
