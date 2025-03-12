class BookingsController < ApplicationController
  def index
    @bookings = Booking.all

    # séparer bookings en 2 arrays
    # un où characters.user == current_user
    # un avec le reste
    # puis 2 each dans view pour séparer rentals et demandes d'autres users
  end

  def create
    @character = Character.find(params[:character_id])
    @booking = Booking.new(params_booking)
    @booking.user = current_user
    @booking.character = @character
    if @character.user == current_user
      flash[:alert] = "sorry but you cannot rent your own characters"
      render 'characters/show', status: :unprocessable_entity
    elsif @booking.save
      redirect_to bookings_path
    else
      render 'characters/show', status: :unprocessable_entity
    end
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end
end
