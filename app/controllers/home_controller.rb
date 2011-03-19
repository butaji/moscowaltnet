require 'rubygems'
require 'feed-normalizer'
require 'open-uri'
   
class HomeController < ApplicationController
 
  def index
  end
  
  def events
    @events = []
    feed = FeedNormalizer::FeedNormalizer.parse open('http://www.iht.com/rss/frontpage.xml')
  end
  
  def news
  end

  def speakers
  end

end
