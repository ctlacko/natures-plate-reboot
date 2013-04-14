class UserMailer < ActionMailer::Base
  default from: "support@naturesplate.biz"

  def create_email(user)
    @user = user
    admins = User.where("admin = ?", true)
    mail :to => admins.all.map(&:email), :subject => "New User Confirmation for NaturesPlate.biz"
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
end
