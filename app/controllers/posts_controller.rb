class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def create
    @event = Event.find(params[:event_id])
    Post.create(body: params[:post][:body], user_id: current_user.id, event: @event)
    # Post.create(body: params[:post][:body], user_id: current_user.id, post: @event)
    redirect_to @event, notice: "New post created."
    #this should redirect to the main 
  end

  private 
    def set_post
      @post = Post.find(params[:id])
    end
end

