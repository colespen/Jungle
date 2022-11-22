class UsersController < ApplicationController
  def new
  end
  
  def create
    # create new variable so method isn't called again in User.new
    new_user_params = user_params
    new_user_params[:email] = new_user_params[:email].strip.downcase  
    user = User.new(new_user_params)
    
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else 
      redirect_to '/signup'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end