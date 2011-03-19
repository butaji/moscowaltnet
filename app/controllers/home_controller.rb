require 'rubygems'
require 'feed-normalizer'
require 'open-uri'
   
class HomeController < ApplicationController
  caches_action :events
 
  def index
  end
  
  def events
  end
  
  def news
  end

  def speakers
  end

end
