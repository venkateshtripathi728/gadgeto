class BookingsController < ApplicationController
  before_action :set_tool, only: [:show,:edit,:update,:destroy]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
    authorize @booking
  end

  def edit

  end



  def update
    @booking.update(booking_params)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])

  end

  def booking_params
    params.require(:booking).permit(:start_date,:end_date,:status)

  end
end
