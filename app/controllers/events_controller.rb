class EventsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]
  before_action :set_event, only: [:show]
  before_action :set_place, only: [:create, :new]

  def new
    @event = Event.new
  end

  def index
  end

  def show
    @place = @event.place
    @post = Post.new
  end

  def create
    @event = @place.events.create(event_params)
    # grabbing emails from event creation form 
    # passing it in as an array of individual strings
    # take out white space and split by comma
    if @event.save
      @emails = params[:event][:email].gsub(" ", "").split(",")
      @emails.each do |email|
        EventMailer.invitation(current_user, email).deliver
      end
      redirect_to user_path(current_user.id)
    else
      redirect_to :back, notice: "there was a problem"
    end
  end


  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_place
    @place = Place.find(params[:place_id])
  end

  def event_params
    params.require(:event).permit(:start, :description).merge(user: current_user)
  end

end
