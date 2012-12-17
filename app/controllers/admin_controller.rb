class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :isAdmin?

  def index  
  @numOfCustomers= User.where("partner = 'f' AND admin='f'").count('email', :distinct => true)
  @numOfPartners= User.where("partner = 't'").count('email', :distinct => true)
  end

  def customers
   @customers = User.where("partner = 'f' AND admin='f'").order(:email)
  end

  def partners
  @partners = User.where("partner = 't'").order(:email)
  end  
end
