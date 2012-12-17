class CurrentUserController < ApplicationController
  
  def delete_stripe_token
    logger.error "Stripe error while creating customer: #{current_user.stripe_customer_token}"
    current_user.update_attribute(:stripe_customer_token,nil)
    current_user.save!
    redirect_to "/users"
  end
  
  def update
    @user = current_user
    current_user.save!
  end
end