class AiMessagesController < ApplicationController
  before_action :authenticate_user!, :set_experience
  before_action :set_ai_message, only: %i[ show edit update destroy ]

  # GET /ai_messages or /ai_messages.json
  def index
    @ai_messages = @experience.ai_messages
  end

  # GET /ai_messages/1 or /ai_messages/1.json
  def show
  end

  # GET /ai_messages/new
  def new
    @ai_message =  @experience.ai_messages.new
  end

  # GET /ai_messages/1/edit
  def edit
  end

  # POST /ai_messages or /ai_messages.json
  def create
    @ai_message = @experience.ai_messages.new(ai_message_params)
    @ai_message.role = :user

    respond_to do |format|
      if @ai_message.save
        format.html { redirect_to experience_url(@experience), notice: "Ai message was successfully created." }
        format.json { render :show, status: :created, location: @ai_message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ai_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ai_messages/1 or /ai_messages/1.json
  def update
    respond_to do |format|
      if @ai_message.update(ai_message_params)
        format.html { redirect_to experience_url(@experience), notice: "Ai message was successfully updated." }
        format.json { render :show, status: :ok, location: @ai_message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ai_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ai_messages/1 or /ai_messages/1.json
  def destroy
    @ai_message.destroy

    respond_to do |format|
      format.html { redirect_to experience_url(@experience), notice: "Ai message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_ai_message
    @ai_message = @experience.ai_messages.find(params[:id])
  end

  def set_experience
    @experience = current_user.experiences.find(params[:experience_id])
  end

  def ai_message_params
    params.require(:ai_message).permit(:content)
  end
end
