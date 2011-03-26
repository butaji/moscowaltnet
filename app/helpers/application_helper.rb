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
end
