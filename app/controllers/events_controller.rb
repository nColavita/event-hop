class EventsController < ApplicationController
	before_action :set_place, only: [:new, :create, :index]
  before_action :authenticate_user!, only:[:new, :create]
  before_action :set_event, only: [:show]

  def new
    @event = Event.new
    @place = Place.find_by(params[:place_id])
  end

  def index
  end

  def show
  end

  def create
    @place.events.create(event_params)
    redirect_to places_path
  end


  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_place
  	@place = Place.find_by(params[:place_id])
  end

  def event_params
    params.require(:event).permit(:start, :description)
  end

end
