class BookingsController < ApplicationController
  def index
    @bookings = Booking.all.order(created_at: :asc)

    @user_bookings = @bookings.select { |booking| booking.user == current_user }
    @bookings_to_review = @bookings.select { |booking| booking.character.user == current_user }
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
    book_status_value
    redirect_to bookings_path

    flash[:notice] = "Your booking was updated successfully"
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def book_status_value
    case params[:booking][:book_status]
    when "accepted" then @booking.update(book_status: true)
    when "declined" then @booking.update(book_status: false)
    when "pending" then @booking.update(book_status: nil)
    when nil then redirect_to bookings_path, status: :unprocessable_entity
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
