class Place < ActiveRecord::Base

	has_attached_file :download,
										:storage => :s3,
										:s3_credentials => Proc.new{|a| a.instance.s3_credentials}

	has_many :events

  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	geocoded_by :address
	after_validation :geocode

end
