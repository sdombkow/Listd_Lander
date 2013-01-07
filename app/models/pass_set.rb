class PassSet < ActiveRecord::Base
  
  belongs_to :bar
  has_many :passes , :dependent => :delete_all
end
