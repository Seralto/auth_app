class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def signin
  end

  def login
    @user = User.where(email: params[:user][:email]).first
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signin'
    end 
  end

  def logout
    session[:user_id] = nil
    redirect_to '/signin'
  end

  private
    def user_params
      params.required(:user).permit(:first_name, :last_name, :email, :password)
    end
end
