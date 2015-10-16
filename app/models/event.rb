class Event < ActiveRecord::Base
	has_many :users
	has_many :posts
	
	belongs_to :user
	belongs_to :place

	has_many :events_users
	has_many :users, through: :events_users
	after_create :add_current_user_to_events_users

	has_attached_file :photo

	def add_current_user_to_events_users
		users << user
	end

	# clean way
	# maybe events controller


	# ugly way
	# set @ user, find that user, find the association of that event and the user, redirect to where it used to be
end
