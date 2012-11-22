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
    @user.save
    UserMailer.create_email(@user).deliver

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end
end


