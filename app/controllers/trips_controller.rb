class TripsController < ApplicationController
  before_action :set_trip, only: [:edit, :update, :show, :destroy]
  def index
    redirect_to login_path if !logged_in?
    @trips = Trip.all
  end
  def new
    redirect_to login_path if !logged_in?
    @trip = Trip.new
  end
  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      flash[:success] = "Trip successfully created !"
      redirect_to trip_path(@trip)
    else
      render 'new'
    end
  end
  def show
    redirect_to login_path if !logged_in?
    #@trip = Trip.find(params[:id])
  end
  def edit
    redirect_to login_path if !logged_in?
    #@trip = Trip.find(params[:id])
  end
  def destroy
    #@trip = Trip.find(params[:id])
    @trip.destroy
    flash[:danger] = "Trip successfully deleted !"
    redirect_to trips_path
  end
  def update
    #@trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      flash[:success] = "Trip details updated !"
      redirect_to trip_path(@trip)
    else
      render 'edit'
    end
  end
  private
    def set_trip
      @trip = Trip.find(params[:id])
    end
    def trip_params
      params.require(:trip).permit(:title, :description, :start_date, :end_date, :travel_mode, :ticket_cost, 
      :home_cab_cost, :destination_cab_cost, :hotel_cost, :local_transport)
    end
end