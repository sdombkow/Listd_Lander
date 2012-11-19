class PassesController < ApplicationController
  def index
  	@user = current_user
  	@passes = @user.passes.order('updated_at DESC')
  end
end
