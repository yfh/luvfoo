class WorkingGroupsController < ApplicationController
  
  include GroupsHelper
  include GroupMethods
  skip_filter :login_required, :only => [:index]
  
  def index
    @h1_title = _('Working Groups')
    @visibility_threshold = is_admin? ? -1 : 0
    @groups = Group.find(:all, :conditions => ['location IS NULL AND visibility > ? AND requires_approval_to_join = true', @visibility_threshold]).paginate(:page => @page, :per_page => @per_page)
    @results = @groups
    respond_to do |format|
      format.html { render :template => 'groups/index'}
      format.xml  { render :xml => @groups }
    end
  end
  
end
