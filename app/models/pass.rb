class Pass < ActiveRecord::Base
  belongs_to :pass_set
  belongs_to :purchase
end
