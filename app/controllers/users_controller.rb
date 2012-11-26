class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :isAdmin? , :except => [:index]
  def index
  @user=current_user
  
  #acquires users ip address for geolocating
  @user_info = request.ip
  @user_info = "128.237.132.1"
  #acquires all the needed information based on the users ip address
  @user_information = Geocoder.search(@user_info)
  #finds all local venues within 10 miles of that users location, orders them based
  #on distance from the user
  @localvenues = Bar.near(@user_information[0].coordinates, 10, :order => :distance)
  
  #if someone has searched for venues and there are locatons within 20 miles of that
  #location displays them, if their are no local then it displays all bars, if their are
  #local venues it displays those
  if params[:search].present?
    @locations = Bar.near(params[:search], 50, :order => :distance)
  else
    @locations = @localvenues
  end
  end

  def show
    @user = User.find(params[:id])
  end
  
  
  def setPartner 
    @user = User.find(params[:id])
	@user.partner=true
	@user.save
	redirect_to :controller=>'admin', :action=>'partners'
	   flash[:notice] = @user.name + " was set as a partner!"
  end
  
  def unsetPartner
        @user = User.find(params[:id])
	@user.partner=false
	@user.save
	redirect_to :controller=>'admin', :action=>'customers'
		   flash[:notice] = @user.name + " was unset as a partner!"
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
