class User < ActiveRecord::Base

	has_attached_file :profilepic, styles: { medium: "300x300#{}", thumb: "100x100#{}", icon: "35x35#{}" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :profilepic, content_type: /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  has_many :events_users
  has_many :posts
end