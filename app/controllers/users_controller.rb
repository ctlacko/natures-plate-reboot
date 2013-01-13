class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def check_confirm_code
    puts params
    @user = User.find(params[:id])
    if @user.confirmation_code == params[:confirmation_code]
      @user.confirmation_code = ""
      @user.confirmed = true
    end
  end

  def create
    @user = User.new(params[:user])
    @user.confirmation_code = SecureRandom.urlsafe_base64
    @user.confirmed = false

    begin
      @user.save!
      UserMailer.create_email(@user).deliver
      cookies[:auth_token] = @user.auth_token
      redirect_to root_url, notice: "Thank you for signing up! Once an administrator has confirmed your account, you will be able to place orders."
    rescue ActiveRecord::RecordInvalid => e
      render "new", notice: e.message
    end
  end
end


