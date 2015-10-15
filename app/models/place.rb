class Place < ActiveRecord::Base
	has_many :events

	has_attached_file :avatar, styles: { medium: "300x300#{}", thumb: "100x100#{}", icon: "35x35#{}" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  geocoded_by :address
  after_validation :geocode
end
