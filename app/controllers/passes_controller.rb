class PassesController < ApplicationController

  before_filter :authenticate_user!
  
  def index
  	@user = current_user
  	@passes = @user.passes.order('updated_at DESC')
  end
  
  def show
		@user=current_user
		@pass = Pass.find(params[:id])
		if(@user != @pass.purchase.user)
		redirect_to:root
		flash[:notice] = "Opps! You went somewhere you're not supposed to."
		end
  end
  
  def toggleRedeem
   @pass = Pass.find(params[:id])
   if(@pass.redeemed?)
   @pass.redeemed=false
   else
   @pass.redeemed=true
   end
   @pass.save
   redirect_to :back
   flash[:notice] = "Redeem Toggled!"
  end
end
