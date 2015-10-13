class Event < ActiveRecord::Base
	has_many :users
	has_many :posts
	belongs_to :admin
	belongs_to :place

	has_attached_file :photo
end
