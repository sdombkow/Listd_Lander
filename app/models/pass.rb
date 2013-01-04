class Pass < ActiveRecord::Base
  extend FriendlyId
  friendly_id :confirmation
  
  validates :confirmation, :uniqueness => true

  belongs_to :pass_set
  belongs_to :purchase
end
