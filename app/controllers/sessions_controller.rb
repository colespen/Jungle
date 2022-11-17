class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If user exists AND pass is entered correctly
    if user && user.authenticate(params[:password])
    # Save user id inside browser cookie to keep user logged in
    session[:user_id] = user.id
    redirect_to '/'
    else
    # If user login doesn't work send back to login
    redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
