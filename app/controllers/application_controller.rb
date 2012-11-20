class ApplicationController < ActionController::Base
  protect_from_forgery
 
  before_filter do |controller|			 # 这里不能获到session

    #redirect_to new_login_url unless controller.send(:logged_in?)
    # redirect_to "http://www.sina.com.cn/"
   
    @remote_ip = request.remote_ip
  end

  after_filter do |controller|
    session[:count]  = 0 unless session[:count]
    @star = Time.now.sec
    session[:count]  = session[:count] + 1  
    @end = Time.now.sec
  end

end
