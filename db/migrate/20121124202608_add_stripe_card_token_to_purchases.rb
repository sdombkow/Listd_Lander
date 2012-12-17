class AddStripeCardTokenToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :stripe_card_token, :string

  end
end
