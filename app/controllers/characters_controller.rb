class CharactersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @characters = Character.all
    @totalchars = Character.all

    if params[:query].present?
      @characters = @characters.where("name ILIKE ?", "%#{params[:query]}%")
    end

    if params[:category].present?
      @characters = @characters.where(category: params[:category])
    end
  end

  def show
    @character = Character.find(params[:id])
    @booking = Booking.new
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.user = current_user
    if @character.save!
      redirect_to character_path(@character)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def character_params
    params.require(:character).permit(
      :name, :category, :price, :description, :photo, :larger_description,
      :height, :eye_color, :activity, :best_friend, :skill_1, :skill_2, :skill_3,
      :loves_most_1, :loves_most_2, :loves_most_3
    )
  end
end
