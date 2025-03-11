class BookingsController < ApplicationController
  def index
    @bookings = Booking.all

    # séparer bookings en 2 arrays
    # un où characters.user == current_user
    # un avec le reste
    # puis 2 each dans view pour séparer rentals et demandes d'autres users
  end
end
