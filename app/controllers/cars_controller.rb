class CarsController < ApplicationController
  before_action :set_car, only: [:offers, :show, :edit, :update, :destroy, :status]

  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all.page(index_params[:page]).per(10)
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit

  end

  # GET /cars/:id/offers
  def offers
    @offers = @car.offers.order("amount DESC").page(index_params[:page]).per(4)
    #@offers = @car.offers( :order => [ "amount DESC" ] )
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        # car_params[:avatar].each do |image|
        #   @car.attached_assets.create(:avatar => image)
        # end
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render action: 'show', status: :created, location: @car }
      else
        format.html { render action: 'new' }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cars/1/status
  def status
    respond_to do |format|
      if @car.update(status_params)
        format.js
        format.html { redirect_to cars_path, notice: 'Car was successfully updated.' }
        format.json { head :no_content }
      else
        format.js
        format.html { redirect_to cars_path, alert: 'Could not update car.' }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    def status_params
      params.permit(:id, :sold)
    end

    def index_params
      params.permit(:page)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:two_door, :year, :miles, :make, :model, :vin, :price, :warranty, :sold, :attached_assets_attributes  => [:avatar] )
    end
end
