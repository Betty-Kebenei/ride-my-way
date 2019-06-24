class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :destroy]

  # GET /rides
  # GET /rides.json
  def index
    RidesCleanupJob.perform_later()
    @rides =
      if request.params[:format]
        Ride.where(ride_type: request.params[:format])
      elsif  Ride.where(respondents: [current_user.name]).length > 0
        Ride.where(user_id: current_user.id) and Ride.where(respondents: [current_user.name])
      else
        Ride.where(user_id: current_user.id)
      end.paginate(page: params[:page], per_page: 4)
  end

  # GET /rides/1
  # GET /rides/1.json
  def show
  end

  # GET /rides/new
  def new
    @ride = Ride.new
  end

  # GET /rides/1/edit
  def edit
  end

  # POST /rides
  # POST /rides.json
  def create
    @ride = Ride.new(ride_params)
    @ride.user_id = current_user.id

    respond_to do |format|
      if @ride.save
        format.html { redirect_to @ride, notice: 'Ride was successfully created.' }
        format.json { render :show, status: :created, location: @ride }
      else
        format.html { render :new,  error: 'All fields are required.' }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rides/1
  # PATCH/PUT /rides/1.json
  def update
    if @ride.user.id != current_user.id
      @respondents = if  @ride.respondents.include?(current_user.name)
                       @ride.respondents.delete(current_user.name)
                     else
                       @ride.respondents.push(current_user.name)
                     end
      params[:ride] = {
          :ride_type => @ride.ride_type,
          :origin => @ride.origin,
          :destination => @ride.destination,
          :take_off => @ride.take_off,
          :number_of_people => @ride.number_of_people - 1,
          :respondents => @respondents,
          :user_id => @ride.user.id
      }

    end
    respond_to do |format|
      if @ride.update(ride_params)
        format.html { redirect_to @ride, notice: 'Ride was successfully updated.' }
        format.json { render :show, status: :ok, location: @ride }
      else
        format.html { render :edit }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rides/1
  # DELETE /rides/1.json
  def destroy
    @ride.destroy
    respond_to do |format|
      format.html { redirect_to rides_url, notice: 'Ride was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_ride
      @ride = Ride.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ride_params
      params.require(:ride).permit(:ride_type, :origin, :destination, :take_off, :number_of_people, :respondents, :user_id)
    end
end
