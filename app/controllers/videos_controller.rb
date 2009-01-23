class VideosController < ApplicationController

    skip_filter :login_required
    
    def index
        @news = NewsItem.find(:all, :conditions => "body LIKE '%googlevideo%'").paginate(:page => @page, :per_page => @per_page)
        respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @news_items }
        end
    end
    
end
