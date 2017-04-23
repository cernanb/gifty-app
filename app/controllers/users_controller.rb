class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.username}!"
      redirect_to '/'
    else
      flash[:alert] = user.errors.full_messages.to_sentence
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
