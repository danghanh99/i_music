class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      byebug
      if @encrypted_password_temp != params[:user][:password_confirmation]
        flash[:danger] = 'password with password confirmation must the same'
        render 'new'
      else  
        if @user.save
          byebug
          redirect_to root_url
        else
          render "new"
        end
      end
  end

  def update
  end

  def edit
  end

  private

  def user_params
    @encrypted_password_temp = params[:user][:encrypted_password]
    params[:user][:encrypted_password] = User.generate_encrypted_password params[:encrypted_password]
    params.require(:user).permit(:email, :encrypted_password)
  end
end
