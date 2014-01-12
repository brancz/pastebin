class PastesController < ApplicationController
	before_action :authenticate_user!, only: [:user_pastes, :edit, :update, :destroy]
  before_action :set_paste, only: [:show, :edit, :update, :destroy]
	before_action :set_feed

  # GET /pastes
  # GET /pastes.json
  def index
    @paste = Paste.new
  end

  # GET /users/pastes
  def user_pastes
    @user_pastes = current_user.pastes
  end

  # GET /pastes/1
  # GET /pastes/1.json
  # GET /pastes/1.text
  def show
    respond_to do |format|
      format.html
      format.json
      format.text { render :text => @paste.content }
      format.any { redirect_to @paste }
    end
  end

  # GET /pastes/new
  def new
		@paste = Paste.new
		if !params['paste_id'].blank?
			@old_paste = Paste.find params['paste_id']
			@paste.title = @old_paste.title
			@paste.content = @old_paste.content
		end
  end

  # GET /pastes/1/edit
  def edit
		puts @paste.user
		puts current_user
		authorize! :update, @paste
  end

  # POST /pastes
  # POST /pastes.json
  # POST /pastes.text
  def create
    @paste = Paste.new(paste_params)

    if user_signed_in?
			@paste.user = current_user
    end

    respond_to do |format|
      if @paste.save
        format.html { redirect_to @paste, notice: 'Paste was successfully created.' }
        format.json { render action: 'show', status: :created, location: @paste }
        format.text { render :text => url_for(:controller => 'pastes', :action => 'show', :id => @paste.id) }
      else
        format.html { render action: 'index' }
        format.json { render json: @paste.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pastes/1
  # PATCH/PUT /pastes/1.json
  def update
		authorize! :update, @paste
    respond_to do |format|
      if @paste.update(paste_params)
        format.html { redirect_to @paste, notice: 'Paste was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @paste.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pastes/1
  # DELETE /pastes/1.json
  def destroy
		authorize! :destroy, @paste
		@paste.destroy
		respond_to do |format|
			format.html { redirect_to pastes_url }
			format.json { head :no_content }
		end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_paste
    @paste = Paste.find(params[:id])
  end

	def set_feed
		@pastes = Paste.feed
	end

  # Never trust parameters from the scary internet, only allow the white list through.
  def paste_params
    params.require(:paste).permit(:title, :content, :language)
  end
end
