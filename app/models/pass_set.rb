class PassSet < ActiveRecord::Base
  extend FriendlyId
  friendly_id :date
  
  belongs_to :bar
  has_many :passes , :dependent => :delete_all
end
