class EventsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :join]
  before_action :set_event, only: [:show, :join]
  before_action :set_place, only: [:create, :new]

  def new
    @event = Event.new
  end

  def index
 @posts = Post.last(10).reverse
  end

  def show
    @place = @event.place
    @post = Post.new
    
    

    @hash = Gmaps4rails.build_markers(@place) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.name
    end
  end

  def create
    @event = @place.events.create(event_params)
    # grabbing emails from event creation form 
    # passing it in as an array of individual strings
    # take out white space and split by comma
    if @event.save
      @emails = params[:event][:email].gsub(" ", "").split(",")
      @emails.each do |email|
        EventMailer.invitation(current_user, email, @event).deliver_now
        # .deliver will be deprecated in rails 5
        # use .deliver_now
      end
      redirect_to user_path(current_user.id)
    else
      redirect_to :back, notice: "There was a problem creating an invitation. Please try again."
    end


    



  end

  def join
    @event.users << current_user
    redirect_to @event, notice: "Added to event."
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
