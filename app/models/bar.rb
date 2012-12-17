class Bar < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :name, :phone_number, :logo, :intro_paragraph, :website_url, 
  :facebook_url,:twitter_url,:open_monday, :open_tuesday,:open_wednesday,:open_thursday,:open_saturday,
  :open_sunday,:houropen_monday,:houropen_tuesday,:hourclose_tuesday,:hourclose_wednesday,:houropen_wednesday,
  :houropen_thursday,:hourclose_thursday,:houropen_friday,:hourclose_friday,:houropen_saturday,:hourclose_saturday,
  :hourclose_sunday,:open_friday,:hourclose_monday,:houropen_sunday

	has_many :pass_sets, :dependent => :destroy
	accepts_nested_attributes_for :pass_sets, :allow_destroy => true
	
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?

	def self.search(search)
	  search_condition = "%" + search + "%"
	  find(:all, :conditions => ['name LIKE ?', search_condition])
	end
	
	belongs_to :user
end
