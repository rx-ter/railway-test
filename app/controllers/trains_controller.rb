class TrainsController < ApplicationController
  
  skip_before_action :http_basic_authenticate, :only => [:search]
  
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  # GET /trains
  # GET /trains.json
  def index
    @trains = Train.includes(:train_route).all
  end

  # GET /trains/1
  # GET /trains/1.json
  def show
  end

  # GET /trains/new
  def new
    @train = Train.new
  end

  # GET /trains/1/edit
  def edit
  end

  # POST /trains
  # POST /trains.json
  def create
    @train = Train.new(train_params)

    respond_to do |format|
      if @train.save
        format.html { redirect_to @train, notice: 'Train was successfully created.' }
        format.json { render :show, status: :created, location: @train }
      else
        format.html { render :new }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trains/1
  # PATCH/PUT /trains/1.json
  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to @train, notice: 'Train was successfully updated.' }
        format.json { render :show, status: :ok, location: @train }
      else
        format.html { render :edit }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trains/1
  # DELETE /trains/1.json
  def destroy
    @train.destroy
    respond_to do |format|
      format.html { redirect_to trains_url, notice: 'Train was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    departure_station = Station.find_by(name: params[:departure_station])
    arrival_station = Station.find_by(name: params[:arrival_station])
    @trains = Train.joins(:train_route).where('train_routes.departure_station_id = ? and train_routes.arrival_station_id = ? and passengers_capacity > 0', departure_station.id, arrival_station.id)
    respond_to do |format|
      format.html 
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_train
      @train = Train.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def train_params
      params.require(:train).permit(:departure_station_id, :arrival_station_id, :departure_time, :arrival_time, :passengers_capacity, :price)
    end
end
