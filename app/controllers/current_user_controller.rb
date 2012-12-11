class CurrentUserController < ApplicationController
  def update
    current_user.save_token(@current_user)
  end
end
