class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :cal_url

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def cal_url
    return "http://www.google.com/calendar/feeds/i1hvc1jnaki2jnrqept2i8sago%40group.calendar.google.com/public/full"
  end

  def authorize
    if (!current_user)
      redirect_to :controller => "home", :action => "index"
    end
  end

end
