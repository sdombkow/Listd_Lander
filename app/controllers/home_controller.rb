class HomeController < ApplicationController
  def index
      @potential_customer = PotentialCustomer.new
  end
  
  def lead_creation
      @potential_customer = PotentialCustomer.new(params[:potential_customer])

        respond_to do |format|
          if @potential_customer.save
            format.html { redirect_to @potential_customer, notice: 'Potential customer was successfully created.' }
            format.json { render json: @potential_customer, status: :created, location: @potential_customer }
          else
            format.html { render action: "new" }
            format.json { render json: @potential_customer.errors, status: :unprocessable_entity }
          end
        end
  end

  def welcome
    if user_signed_in?
      if current_user.admin?
        redirect_to :controller=>'admin'
      elsif current_user.partner?
        redirect_to :controller=>'bars'
      end
    end
    
    #acquires users ip address for geolocating
    @user_info = request.ip
    @user_info = "98.122.189.233"
    #acquires all the needed information based on the users ip address
    @user_information = Geocoder.search(@user_info)
    while @user_information.empty?
    @user_information = Geocoder.search(@user_info)
    end
    #THIS WHILE LOOP FIXES THE NIL:CLASS CASE BUT IS PROBABLY NOT THE BEST WAY TO GO ABOUT IT
  
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

end
