class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  #  def post
  #  end 


  #  def post
  #     @post= post
      
    
  #   end
  

  # def index
  #   @posts = Post.all
  # end
  
  # def new
  #   @post = Post.new
  # end

  # # def show
  # #   @comment = Comment.new
  # # end 
 
  # def edit
  # end

  def create
    @event = Event.find(params[:event_id])

    Post.create(body: params[:post][:body], user_id: current_user.id, event: @event)
    # Post.create(body: params[:post][:body], user_id: current_user.id, post: @event)
    redirect_to @event, notice: "New post created."
    
     #this sould be redirect the main 
  end

  # def update
  # end

  # def detroy
  # end



  private 

    def set_post
      @post = Post.find(params[:id])
    end
end

