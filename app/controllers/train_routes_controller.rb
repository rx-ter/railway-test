class TrainRoutesController < ApplicationController
  
    before_action :set_train_route, only: [:show, :edit, :update, :destroy]
  
    # GET /train_routes
    # GET /train_routes.json
    def index
      @train_routes = TrainRoute.includes(:departure_station, :arrival_station).all
      byebug
    end
  
    # GET /train_routes/1
    # GET /train_routes/1.json
    def show
    end
  
    # GET /train_routes/new
    def new
      @train_route = TrainRoute.new
      @stations = Station.all
      @trains = Train.all
    end
  
    # GET /train_routes/1/edit
    def edit
      @stations = Station.all
      @trains = Train.all
    end
  
    # POST /train_routes
    # POST /train_routes.json
    def create
      @train_route = TrainRoute.new(train_route_params)
  
      respond_to do |format|
        if @train_route.save
          format.html { redirect_to @train_route, notice: 'TrainRoute was successfully created.' }
          format.json { render :show, status: :created, location: @train_route }
        else
          format.html { render :new }
          format.json { render json: @train_route.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /train_routes/1
    # PATCH/PUT /train_routes/1.json
    def update
      respond_to do |format|
        if @train_route.update(train_route_params)
          format.html { redirect_to @train_route, notice: 'TrainRoute was successfully updated.' }
          format.json { render :show, status: :ok, location: @train_route }
        else
          format.html { render :edit }
          format.json { render json: @train_route.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /train_routes/1
    # DELETE /train_routes/1.json
    def destroy
      @train_route.destroy
      respond_to do |format|
        format.html { redirect_to train_routes_url, notice: 'TrainRoute was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def search
      departure_station = params[:departure_station]
      arrival_station = params[:arrival_station]
      @train_routes = TrainRoute.where('departure_station: ? and arrival_station: ? and passenger_capacity > 0', departure_station, arrival_station)
      respond_to do |format|
        format.html 
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constrain_routets between actions.
      def set_train_route
        @train_route = TrainRoute.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def train_route_params
        params.require(:train_route).permit(:departure_station_id, :arrival_station_id, :train)
      end
  end
  