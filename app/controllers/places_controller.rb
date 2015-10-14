class PlacesController < ApplicationController
	before_action :authenticate_admin!, only: [:new, :create]

  def create
  	@place = Place.new(place_params)
  	if @place.save
  		redirect_to places_path
  	else 
  		redirect_to :back, notice: "There was a problem."
  	end
  end

  def new
  	@place = Place.new
  end

  def index
  	@places = Place.all
  end

  def show
  end

  private 

  def place_params
  	params.require(:place).permit(:name, :address, :zipcode, :website, :description, :avatar)
  end
end
