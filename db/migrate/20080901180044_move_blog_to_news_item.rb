class MoveBlogToNewsItem < ActiveRecord::Migration
  def self.up
    # blogs = Blog.find(:all)
    # blogs.each do |blog|
    #   newsitem = NewsItem.new(:title => blog.title, :body => blog.body, :newsable_id => blog.user_id, :newsable_type => 'User', :created_at => blog.created_at, :updated_at => blog.updated_at)
    #   newsitem.save
    # end
  end

  def self.down
    # blogs = Blog.find(:all)
    # blogs.each do |blog|
    #   newsitem = NewsItem.find(:first, :conditions => ["newsable_type = 'User' AND newsable_id = ?", blog.user_id])
    #   newsitem.destroy if newsitem
    # end
  end
end

