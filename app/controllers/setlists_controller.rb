class SetlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_setlist, only: [:show, :edit, :update, :destroy]

  # GET /setlists
  # GET /setlists.json
  def index
    @setlists = Setlist.all
  end

  # GET /setlists/1
  # GET /setlists/1.json
  def show
  end

  # GET /setlists/new
  def new
    @setlist = Setlist.new
  end

  # GET /setlists/1/edit
  def edit
  end

  # POST /setlists
  # POST /setlists.json
  def create
    @setlist = current_user.setlists.build(setlist_params)

    respond_to do |format|
      if @setlist.save
        format.html { redirect_to @setlist, notice: 'Setlist was successfully created.' }
        format.json { render :show, status: :created, location: @setlist }
      else
        format.html { render :new }
        format.json { render json: @setlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /setlists/1
  # PATCH/PUT /setlists/1.json
  def update
    respond_to do |format|
      if @setlist.update(setlist_params)
        format.html { redirect_to @setlist, notice: 'Setlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @setlist }
      else
        format.html { render :edit }
        format.json { render json: @setlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setlists/1
  # DELETE /setlists/1.json
  def destroy
    @setlist.destroy
    respond_to do |format|
      format.html { redirect_to setlists_url, notice: 'Setlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setlist
      @setlist = current_user.setlists.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setlist_params
      params.require(:setlist).permit(:name, :song_ids => [])
    end
end
