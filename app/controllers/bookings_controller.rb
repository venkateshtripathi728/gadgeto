class BookingsController < ApplicationController
  before_action :set_tool, only: [:show,:edit,:update,:destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end
  
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit 

  end

  def update
    @booking.update(booking_params)
  end 

  def destroy
    @booking.destroy
    redirect_to bookings_path


  private

  def set_booking
    @booking = Booking.find(params[:id])

  end

  def booking_params
    params.require(:booking).permit(:start_date,:end_date,:status)

  end
end
