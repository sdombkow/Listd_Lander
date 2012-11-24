class PassesController < ApplicationController
  def index
  	@user = current_user
  	@passes = @user.passes.order('updated_at DESC')
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
