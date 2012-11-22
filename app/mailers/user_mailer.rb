class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def create_email(user)
    @user = user
    admins = User.where("admin = ?", true)
    admins.each do |admin|
      mail :to => admin.email, :subject => "New User Confirmation for NaturesPlate.biz"
    end
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
end
