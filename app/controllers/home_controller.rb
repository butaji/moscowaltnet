require 'open-uri'
require 'json'
   
class HomeController < ApplicationController 
  caches_action :lastevent, :expires_in => 24.hours, :layout => false
  
  def index
  end
  
  def lastevent
    @lastevents = JSON.parse(open("#{cal_url}?alt=json&futureevents=true&orderby=starttime&sortorder=ascending&max-results=1").read)["feed"]["entry"]
    if @lastevents && @lastevents.first
      @event = first
    end
  end
  
  def events
    @events = JSON.parse(open("#{cal_url}?alt=json&orderby=starttime&sortorder=ascending").read)["feed"]["entry"]
  end
  
  def event
    @event = JSON.parse(open("#{cal_url}/#{params[:id]}?alt=json").read)["entry"]
  end
  
  def news
  end

  def speakers
    @speeches = Speech.where(:approved => false).order('voices DESC')
  end
  
end
