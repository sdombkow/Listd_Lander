class Purchase < ActiveRecord::Base
  belongs_to :user
  has_many :passes
  attr_accessor :num_passes,:name, :stripe_card_token, :bar, :pass_set
  attr_accessible :stripe_card_token, :name, :date, :num_passes, :pass_set, :bar
  
  def payment
    if valid?
      logger.error "Stripe Card Token: #{name} and #{stripe_card_token}"
      charge = Stripe::Charge.create(
        :amount => 1000, # amount in cents, again
        :currency => "usd",
        :card => stripe_card_token,
        :description => "payinguser@example.com"
      )
      save!
    end
    rescue Stripe::InvalidRequestError => e
        logger.error "Stripe error while creating customer: #{e.message}"
        errors.add :base, "There was a problem with your credit card."
        false
    end
    
    def payment_return_customer(user)
      if valid?
        logger.error "Stripe Card Token: #{name} and #{stripe_card_token}"
        charge = Stripe::Charge.create(
          :amount => 1000,
          :currency => "usd",
          :customer => user.stripe_customer_token
        )
        save!
      end
      rescue Stripe::InvalidRequestError => e
          logger.error "Stripe error while creating customer: #{e.message}"
          errors.add :base, "There was a problem with your credit card."
          false
      end
    
    def save_with_payment(user)
      if valid?
        logger.error "Stripe Card Token: #{name} and #{stripe_card_token}"
        customer = Stripe::Customer.create(
          :card => stripe_card_token,
          :description => name
        )
        user.stripe_customer_token = customer.id
        user.save
        charge = Stripe::Charge.create(
          :amount => 1000,
          :currency => "usd",
          :customer => user.stripe_customer_token
        )
        save!
      end
      rescue Stripe::InvalidRequestError => e
          logger.error "Stripe error while creating customer: #{e.message}"
          errors.add :base, "There was a problem with your credit card."
          false
      end

end