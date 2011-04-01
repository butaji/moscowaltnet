module ApplicationHelper
  def title(page_title)  
    content_for(:title) { page_title }  
  end
  
  def page_id()
    action = params[:controller] + "_" + params[:action]
    
    if (params[:id])
      action += "_" + params[:id]
    end
    
    return action
  end
  
  def parse_date_time(param)
    DateTime.parse(param).ctime
  end
  
  def page_with_comments()
    return (!(page_id().include? "speeches") || (page_id().include? "speeches_show")) && (page_id() != "home_index")
      
  end
end
