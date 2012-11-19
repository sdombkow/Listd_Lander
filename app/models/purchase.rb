class Purchase < ActiveRecord::Base
  belongs_to :user
  has_many :passes
  attr_accessor :num_passes,:name
end
