class Bar < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :name, :phone_number, :intro_paragraph

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
