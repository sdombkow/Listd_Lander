class HomeController < ApplicationController
  def index
  if current_user
  if current_user.admin?
	redirect_to :controller=>'admin'
  elsif current_user.partner?
	redirect_to :controller=>'bars'
	else
	redirect_to :controller=>'users'
  end
  end
  end
end
