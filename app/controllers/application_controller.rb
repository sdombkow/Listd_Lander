class ApplicationController < ActionController::Base
  protect_from_forgery
  
    def isPartner?
	unless current_user.partner?
	redirect_to :controller=>'home'
	end
	end
	
	def isAdmin?
	unless current_user.admin?
	redirect_to :controller=>'home'
	end
	end
end
