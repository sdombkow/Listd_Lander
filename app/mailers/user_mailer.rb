class UserMailer < ActionMailer::Base
  default :from => "listdtest@gmail.com"

  def purchase_confirmation(user)
    mail(:to => user.email, :subject => "Purchased Confirmed!")
  end
end