class DreamsController < ApplicationController
  # Set rules for dream controller 
  before_action :set_dream, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 
  before_action :current_user
  # GET /dreams
  # GET /dreams.json
  # Only show current user's private dreambox and provide the search condition
  def index
    @dreams = current_user.dreams.all.order("created_at DESC").search(params[:search])
  end

  # GET /dreams/1
  # GET /dreams/1.json
  # Only show current user's private dreambox
  def show
    @dreams = current_user.dreams.all
  end

  # GET /dreams/new
  # let current user write down their dream
  def new
    @dream = current_user.dreams.build
  end

  # GET /dreams/1/edit
  def edit
  end

  # POST /dreams
  # POST /dreams.json
  # create private dream journal for current user
  def create
    @dream = current_user.dreams.build(dream_params)

    respond_to do |format|
      if @dream.save
        format.html { redirect_to @dream, notice: 'Your Dream was successfully saved in your DreamBox.' }
        format.json { render :show, status: :created, location: @dream }
      else
        format.html { render :new }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dreams/1
  # PATCH/PUT /dreams/1.json
  def update
    respond_to do |format|
      if @dream.update(dream_params)
        format.html { redirect_to @dream, notice: 'Your Dream was successfully updated.' }
        format.json { render :show, status: :ok, location: @dream }
      else
        format.html { render :edit }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dreams/1
  # DELETE /dreams/1.json
  def destroy
    @dream.destroy
    respond_to do |format|
      format.html { redirect_to dreams_url, notice: 'Dream was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dream
      @dream = Dream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dream_params
      params.require(:dream).permit(:description, :start_time)
    end
end
