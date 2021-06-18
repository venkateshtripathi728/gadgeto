class BookingsController < ApplicationController
  before_action :set_booking, only: [:show,:edit,:update,:destroy]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking

  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @tool = Tool.find(params[:tool_id])
    @booking.tool = @tool
    if @booking.save
      redirect_to bookings_path
    else
      render "tools/show"
    end
    authorize @booking
  end

  def edit

  end

  def update
    @booking.update(booking_params)
    authorize @booking
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
    authorize @booking
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "approved"
    @booking.save
    redirect_to bookings_path, notice: "Booking accepted"
    authorize @booking
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = "declined"
    @booking.save
    redirect_to bookings_path, notice: "Booking declined"
    authorize @booking
  end


  private

  def set_booking
    @booking = Booking.find(params[:id])

  end

  def booking_params
    params.require(:booking).permit(:start_date,:end_date,:status)

  end
end
