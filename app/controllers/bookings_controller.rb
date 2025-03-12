class BookingsController < ApplicationController
  def index
    @bookings = Booking.all

    @user_bookings = @bookings.select { |booking| booking.user == current_user }
    @bookings_to_review = @bookings.select { |booking| booking.character.user == current_user }
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
    saving_booking
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(book_status: book_status_value)
      redirect_to bookings_path
    else
      redirect_to bookings_path, status: :unprocessable_entity
    end
  end

  private

  def book_status_value
    case params[:book_status]
    when "accepted" then true
    when "declined" then false
    when "pending" then nil
    end
  end

  def saving_booking
    if @character.user == current_user
      flash[:alert] = "sorry but you cannot rent your own characters"
      render 'characters/show', status: :unprocessable_entity
    elsif @booking.save
      redirect_to bookings_path
    else
      render 'characters/show', status: :unprocessable_entity
    end
  end

  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end

  def params_booking_update
    params.require(:booking).permit(:book_status)
  end
end
