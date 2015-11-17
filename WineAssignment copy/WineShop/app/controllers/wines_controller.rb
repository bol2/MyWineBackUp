class WinesController < ApplicationController
  before_action :set_current_page, except: [:index]
  before_action :set_wine, only: [:show, :edit, :update, :destroy]

require 'net/http'
require 'json'
require 'rubygems'
require 'uri'

  def getWinefromDB
   uri = URI("http://localhost/GetWines.php")
   resp = Net::HTTP.get(uri)
   result = JSON.parse(resp)

   result.each do |r|
       puts r
       puts Wine.class
       @wine =  Wine.new(r)
       @wine.save
   end


#   puts result[0]
#   @wine = Wine.new(result[0])
#   @wine.save

  end

  # GET /wines
  # GET /wines.json
  def index
    @wines = Wine.all
    @wines.each do |wine|
       wine.destroy
    end
    getWinefromDB
    @wines = Wine.paginate(page: params[:page],per_page: params[:per_page])
  end

  # GET /wines/1
  # GET /wines/1.json
  def show
  end

  # GET /wines/new
  def new
    @wine = Wine.new
  end

  # GET /wines/1/edit
  def edit
  end

  # POST /wines
  # POST /wines.json
  def create
    @wine = Wine.new(wine_params)

    respond_to do |format|
      if @wine.save
        format.html { redirect_to @wine, notice: 'Wine was successfully created.' }
        format.json { render :show, status: :created, location: @wine }
      else
        format.html { render :new }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wines/1
  # PATCH/PUT /wines/1.json
  def update
    respond_to do |format|
      if @wine.update(wine_params)
        format.html { redirect_to @wine, notice: 'Wine was successfully updated.' }
        format.json { render :show, status: :ok, location: @wine }
      else
        format.html { render :edit }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1
  # DELETE /wines/1.json
  def destroy
    @wine.destroy
    respond_to do |format|
      format.html { redirect_to wines_url(page: @current_page), notice: 'Wine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wine_params
      params.require(:wine).permit(:image_url, :shortDescription, :bottleSize, :price, :company, :longDescription, :country, :grape, :vegetarians, :title)
    end

    def set_current_page
       @current_page = params[:page] || 1
    end
end
