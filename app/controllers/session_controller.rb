class SessionController < ApplicationController
  def create
    # binding.pry
    user = User.from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    session[:nickname] = "#{user.nickname}"
    flash[:notice] = "#{user.nickname}"
    redirect_to "/"
  end

  def destroy
    session[:user_id] = nil
    session[:nickname] = nil
    redirect_to root_path
  end
end
