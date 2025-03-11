class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end
    
  def show
    @character = Character.find(params[:id])
    @booking = Booking.new
  end
end
