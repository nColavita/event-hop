class User < ActiveRecord::Base

	has_attached_file :download,
											:storage => :s3,
											:s3_credentials => Proc.new{|a| a.instance.s3_credentials}


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  has_many :events_users
  has_many :posts

 	
  validates_attachment_content_type :profilepic, content_type: /\Aimage\/.*\Z/
end