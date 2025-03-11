class CharactersController < ApplicationController
  def show
    @character = Character.find(params[:id])
    @booking = Booking.new
  end
end
