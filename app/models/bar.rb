class Bar < ActiveRecord::Base

	has_many :pass_sets
	accepts_nested_attributes_for :pass_sets, :allow_destroy => true

	def self.search(search)
	  search_condition = "%" + search + "%"
	  find(:all, :conditions => ['name LIKE ?', search_condition])
	end
	
	belongs_to :user
end
