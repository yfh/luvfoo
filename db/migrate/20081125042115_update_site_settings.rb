class UpdateSiteSettings < ActiveRecord::Migration
  def self.up
    site = Site.first
    site.title = 'Teachers Without Borders'
    site.subtitle = 'Global Colleagues/Local Solutions'
    site.slogan = '<em>Changing the world... <br /> one teacher at a time...</em>'
    site.background_color = 'e9efd5'
    site.font_color = '000'
    site.font_style = '"Lucida Grande",Helvetica,Arial,sans-serif'
    site.font_size = "12px"
    site.content_background_color = 'fff'
    site.a_font_style = '"Lucida Grande",Helvetica,Arial,sans-serif'
    site.a_font_color = '4b7041'
    site.top_background_color = '4B7041'
    site.top_color = 'fff'
    site.save!
  end

  def self.down
  end
end
