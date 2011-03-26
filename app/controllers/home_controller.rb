require 'open-uri'
require 'json'
   
class HomeController < ApplicationController 
  caches_action :lastevent, :expires_in => 24.hours, :layout => false
  
  def index
  end
  
  def lastevent
    logger.debug "================ lastevent've called"
    @lastevent = JSON.parse(open("http://www.google.com/calendar/feeds/i1hvc1jnaki2jnrqept2i8sago%40group.calendar.google.com/public/full?futureevents=true&orderby=starttime&sortorder=ascending&max-results=1&alt=json").read)["feed"]["entry"][0]
  end
  
  def events
  end
  
  def news
  end

  def speakers
  end

end
