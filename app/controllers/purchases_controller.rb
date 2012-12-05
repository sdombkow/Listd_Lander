class PurchasesController < ApplicationController
	def create
		@user = current_user
		@bar = Bar.find(params[:purchase][:bar])
		@pass_set = PassSet.find(params[:purchase][:pass_set])
		num_passes = params[:purchase][:num_passes].to_i
		if num_passes > @pass_set.unsold_passes
			flash[:error] = 'Not enough passes left'
			redirect_to [@bar,@pass_set]
			return
		end
		@purchase = Purchase.new(params[:purchase])
		@purchase.date = params[:purchase][:date]
		if @purchase.save_with_payment(@user)
		
		    @pass_set.sold_passes+=num_passes
		    @pass_set.unsold_passes-=num_passes
		    @pass_set.save
		   # for i in 0..num_passes-1
			    pass = Pass.new
			    pass.name = params[:purchase][:name]
			    pass.purchase_id = @purchase.id
			    pass.pass_set_id = @pass_set.id
			    pass.redeemed = false
				  pass.entries=num_passes
			    pass.save
		    #end

		    redirect_to [@bar,@pass_set], notice: 'Purchase created'
		  else
		    redirect_to [@bar,@pass_set], notice: 'Purchase NOT Created'
		  end
	  end
end