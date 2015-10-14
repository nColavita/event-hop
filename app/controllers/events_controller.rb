class EventsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]
  before_action :set_event, only: [:show]

  def new
    @event = Event.new
  end

  def index
  end

  def show
    @place = @event.place
  end

  def create
    @event = @place.events.create(event_params)
    redirect_to @event
  end


  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:start, :description).merge(user: current_user)
  end

end
