class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.id
      session[:user_id] = user.id
      flash[:notice] = 'You have successfully logged in'
      redirect_to root_path
    else
      flash[:error] = 'Kindly login with your Andela Email'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have successfully logged out'
    redirect_to '/login'
  end
end
