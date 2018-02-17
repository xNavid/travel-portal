class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end
  def new
    @trip = Trip.new
  end
  def create
    @trip = Trip.new(trip_params)
    
    if @trip.save
      flash[:notice] = "Trip successfully created !"
      redirect_to trip_path(@trip)
    else
      render 'new'
    end
  end
  def show
    @trip = Trip.find(params[:id])
  end
  def edit
    @trip = Trip.find(params[:id])
  end
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    flash[:notice] = "Trip successfully deleted !"
    redirect_to trips_path
  end
  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      flash[:notice] = "Trip details updated !"
      redirect_to trip_path(@trip)
    else
      render 'edit'
    end
  end
  private
    def trip_params
      params.require(:trip).permit(:title, :description, :start_date, :end_date, :travel_mode, :ticket_cost, 
      :home_cab_cost, :destination_cab_cost, :hotel_cost, :local_transport)
    end
end