class SessionsController < ApplicationController
  def new

  end

  def create
    # binding.pry
    user = User.from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    session[:nickname] = "#{user.nickname}"
    # flash[:notice] = "#{Signed in}"
    redirect_to "/", notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    session[:nickname] = nil
    redirect_to root_path, notice: "Signed out!"
  end

  def failure
    # binding.pry
    redirect_to root_url, notice: "Authentication failed, please try again."
  end
end
