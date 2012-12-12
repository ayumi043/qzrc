class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_auth(request.env['omniauth.auth'])
    binding.pry
    session[:user_id] = user.id
    session[:nickname] = "#{user.nickname}"
    # flash[:notice] = "#{user.nickname}"
    redirect_to "/", notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    session[:nickname] = nil
    redirect_to root_path, notice: "Signed out!"
  end

  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
end
