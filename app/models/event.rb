class Event < ActiveRecord::Base
	has_many :users
	has_many :posts
	
	belongs_to :user
	belongs_to :place

	has_many :events_users
	has_many :users, through: :events_users
	after_create :add_current_user_to_events_users
	has_attached_file :photo
	

	# validates_presence_of :email, :start

    
    # scope :upcoming, -> { where("start > ? AND start < ?", Time.now, Time.now + 6.months) }
    # scope :past, -> { where("start < ?", Time.now) }
    # scope :joinable, -> { select('events.*, count(users.id) as user_count').joins(:users).group('events.id').having('user_count > 1 AND user_count < 6')}
    # scope :roulettable, -> { upcoming.joinable }

	def add_current_user_to_events_users
		users << user
	end
end
 