class UsersController < ApplicationController
  before_filter :authenticate_user!
  # before_action :set_user, only:[:show, :edit, :update, :destroy]

#   def index
#   end

#   def new
#     @user = User.new
#   end

  def show
   @user = current_user 
   
   @joined_events = @user.joined_events
  end

#   def edit
#   end

#   def update
#     if @user.update(params_user)
#       redirect_to @user, notice: 'Profile Updated'
#     else
#       render :edit
#     end
#   end

#   def destroy
#   end

#   # def admin
#   #   @event = Event.new
#   #   if @event.save
#   #     current_user[:admin] = true #Current User becomes Admin of this specific Event Created
#   #   else
#   #     notice: 'There was a problem filling out this event. Please fill out all the fields correctly.'
#   #   end
#   # end

  # private

  # def set_user
  #   @user = User.find(params[:id])
  # end

  # def user_params
  #   params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
  # end


end
