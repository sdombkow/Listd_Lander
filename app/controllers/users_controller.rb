class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :isAdmin? , :except => [:index]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  
  def setPartner 
    @user = User.find(params[:id])
	@user.partner=true
	@user.save
	redirect_to :controller=>'admin', :action=>'customers'
  end
  
  def unsetPartner
        @user = User.find(params[:id])
	@user.partner=false
	@user.save
	redirect_to :controller=>'admin', :action=>'partners'
  end

  def destroy
  @user = User.find(params[:id])
  @userTemp = @user
  @user.destroy
  if(@userTemp.partner?)
      respond_to do |format|
      format.html { redirect_to :controller=>'admin', :action=>'partners'}
      format.json { head :no_content }
	  end
  else
      respond_to do |format|
      format.html { redirect_to :controller=>'admin', :action=>'customers'}
      format.json { head :no_content }
	  end
  end
  end
  
end
