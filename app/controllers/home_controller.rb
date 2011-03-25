require 'open-uri'
require 'json'
   
class HomeController < ApplicationController 
  def index
  end
  
  def events
    events_key = "events_data_key";
    
    if (!Rails.cache.read(events_key))
      Rails.cache.write(events_key, JSON.parse(open("http://www.google.com/calendar/feeds/i1hvc1jnaki2jnrqept2i8sago%40group.calendar.google.com/public/full?futureevents=true&orderby=starttime&sortorder=ascending&max-results=1&alt=json").read) )
    end
    @events = Rails.cache.read(events_key)["feed"]["entry"][0]
  end
  
  def news
  end

  def speakers
  end

end
