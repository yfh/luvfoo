namespace :luvfoo do

  namespace :db do
    desc "Add yfh profile fields to the database"
    task :load_yfh_profile => :environment do

      sql = ActiveRecord::Base.connection()
      sql.execute("DELETE FROM bag_properties")
      sql.execute("DELETE FROM bag_property_enums")
      
      BagProperty.create(
        :name => 'phone', 
        :label => 'Phone', 
        :default_visibility => BagProperty::VISIBILITY_ADMIN,
        :sort => 5 
      ) 

      city_property_id = BagProperty.create(
        :name => 'city', 
        :label => 'City', 
        :data_type => BagProperty::DATA_TYPE_ENUM,
        :display_type => BagProperty::DISPLAY_TYPE_DROP_DOWN_LIST, 
        :default_visibility => BagProperty::VISIBILITY_USERS, 
        :registration_page => 1,
        :sort => 10 
      ).id
      
      BagPropertyEnum.create(:bag_property_id => city_property_id, :value => "other", :name => "Other", :sort => 0)
      sort_index = 1
      Group.find(:all, :conditions => {:location => true}).each do |group|
        BagPropertyEnum.create(:bag_property_id => city_property_id, :value => group.name, :name => group.name, :sort => sort_index)
        sort_index = sort_index + 1
      end

      BagProperty.create(
        :name => 'member_of', 
        :label => 'I am a member of', 
        :default_visibility => BagProperty::VISIBILITY_ADMIN,
        :sort => 13 
      ) 

      BagProperty.create(
        :name => 'assignment', 
        :label => 'Assignment', 
        :default_visibility => BagProperty::VISIBILITY_ADMIN,
        :sort => 16 
      ) 

      bp_id = BagProperty.create(
        :name => 'organization_member', 
        :label => 'Member of a volunteer or civil society organization', 
        :data_type => BagProperty::DATA_TYPE_ENUM,
        :display_type => BagProperty::DISPLAY_TYPE_RADIO, 
        :default_visibility => BagProperty::VISIBILITY_ADMIN, 
        :sort => 20 
      ).id
      [
        ['Yes','yes',10],
        ['No','no',20],
      ].each {|c| BagPropertyEnum.create(:bag_property_id => bp_id, :value => c[1], :name => c[0], :sort => c[2]) }
      
      BagProperty.create(
        :name => 'organization', 
        :label => 'Organization', 
        :default_visibility => BagProperty::VISIBILITY_FRIENDS, 
        :registration_page => 1,
        :sort => 30 
      )

      bp_id = BagProperty.create(
        :name => 'organization_status', 
        :label => 'Organization Status', 
        :data_type => BagProperty::DATA_TYPE_ENUM,
        :display_type => BagProperty::DISPLAY_TYPE_RADIO, 
        :default_visibility => BagProperty::VISIBILITY_FRIENDS, 
        :registration_page => 1,
        :sort => 40 
      ).id
      [
        ['Association','1',10],
        ['Foundation','2',20],
        ['Youth Council','3',30],
        ['Student Club/Union/Council','4',40],
        ['Youth Network','5',50],
        ['Other','6',60],
      ].each {|c| BagPropertyEnum.create(:bag_property_id => bp_id, :value => c[1], :name => c[0], :sort => c[2]) }
      
      BagProperty.create(
        :name => 'organization_website', 
        :label => 'Web Site of your Organization', 
        :default_visibility => BagProperty::VISIBILITY_FRIENDS, 
        :registration_page => 1,
        :sort => 50 
      )
      
      bp_id = BagProperty.create(
        :name => 'why_joined', 
        :label => 'Reason for signing up for www.tgag.org', 
        :data_type => BagProperty::DATA_TYPE_ENUM,
        :display_type => BagProperty::DISPLAY_TYPE_RADIO, 
        :default_visibility => BagProperty::VISIBILITY_ADMIN, 
        :registration_page => 1,
        :sort => 53 
      ).id
      [
        ['To benefit from the courses','1',10],
        ['To represent my organization','2',30],
        ['To learn about youth projects','3',40],
        ['To find partners for new projects','4',50],
        ['Other','5',60],
      ].each {|c| BagPropertyEnum.create(:bag_property_id => bp_id, :value => c[1], :name => c[0], :sort => c[2]) }
      
      bp_id = BagProperty.create(
        :name => 'how_found', 
        :label => 'How did you learn about www.tgag.org?', 
        :data_type => BagProperty::DATA_TYPE_ENUM,
        :display_type => BagProperty::DISPLAY_TYPE_RADIO, 
        :default_visibility => BagProperty::VISIBILITY_ADMIN, 
        :registration_page => 1,
        :sort => 56 
      ).id
      [
        ['Search Engine','1',10],
        ['Youth Council Briefings','2',30],
        ['Friends','3',40],
        ['Other','4',50],
      ].each {|c| BagPropertyEnum.create(:bag_property_id => bp_id, :value => c[1], :name => c[0], :sort => c[2]) }

      BagProperty.create(
        :name => 'school', 
        :label => 'Current School', 
        :default_visibility => BagProperty::VISIBILITY_FRIENDS, 
        :sort => 60 
      )

      BagProperty.create(
        :name => 'previous_school', 
        :label => 'Last graduated from', 
        :default_visibility => BagProperty::VISIBILITY_FRIENDS, 
        :sort => 65 
      )

      BagProperty.create(
        :name => 'seminars', 
        :label => 'Education and Seminars', 
        :default_visibility => BagProperty::VISIBILITY_FRIENDS,
        :display_type => BagProperty::DISPLAY_TYPE_TEXT_AREA, 
        :sort => 67 
      )

      BagProperty.create(
        :default_visibility => BagProperty::VISIBILITY_FRIENDS, 
        :name => 'flickr', 
        :label => 'Flickr', 
        :sort => 70, 
        :is_link => true) 

      BagProperty.create(
        :default_visibility => BagProperty::VISIBILITY_FRIENDS, 
        :name => 'msn', 
        :label => 'MSN Messenger', 
        :sort => 80, 
        :is_link => true, 
        :prefix => 'http://members.msn.com/') 
      
      BagProperty.create(:name => 'view_blog', :label => 'My Blog Posts', :default_visibility => BagProperty::VISIBILITY_FRIENDS, :display_type => BagProperty::DISPLAY_TYPE_OPTION, :sort => 260)
      BagProperty.create(:name => 'view_photos', :label => 'My Photos', :default_visibility => BagProperty::VISIBILITY_FRIENDS, :display_type => BagProperty::DISPLAY_TYPE_OPTION, :sort => 270)
      BagProperty.create(:name => 'view_groups', :label => 'My Groups', :default_visibility => BagProperty::VISIBILITY_FRIENDS, :display_type => BagProperty::DISPLAY_TYPE_OPTION, :sort => 280)
      BagProperty.create(:name => 'view_colleagues', :label => 'My Colleagues', :default_visibility => BagProperty::VISIBILITY_FRIENDS, :display_type => BagProperty::DISPLAY_TYPE_OPTION, :sort => 290)
      BagProperty.create(:name => 'view_activities', :label => 'My Recent Activity Feed', :default_visibility => BagProperty::VISIBILITY_FRIENDS, :display_type => BagProperty::DISPLAY_TYPE_OPTION, :sort => 300)
      BagProperty.create(:name => 'view_comments', :label => 'Comments On My Profile', :default_visibility => BagProperty::VISIBILITY_USERS, :display_type => BagProperty::DISPLAY_TYPE_OPTION, :sort => 305)
      BagProperty.create(:name => 'view_shares', :label => 'Items I Have Shared', :default_visibility => BagProperty::VISIBILITY_FRIENDS, :display_type => BagProperty::DISPLAY_TYPE_OPTION, :sort => 307)
      BagProperty.create(:name => 'direct_message', :label => 'Direct Message', :default_visibility => BagProperty::VISIBILITY_FRIENDS, :display_type => BagProperty::DISPLAY_TYPE_OPTION, :sort => 310)
      
      puts 'Done adding yfh profile fields!'
    end
  end

  namespace :db do
    desc "Transfer data from user model to property bags"
    task :migrate_yfh_profile => :environment do

      sql = ActiveRecord::Base.connection()
      sql.execute("DELETE FROM bag_property_values")

      bag_property_ids = {}
      BagProperty.find(:all).each do |p|
        bag_property_ids[p.name] = p.id
      end
      
      city_id = bag_property_ids["city"]
      city_enums = BagPropertyEnum.find(:all, :conditions => {:bag_property_id => city_id})
      city_enum_ids = {}
      l = city_enums.find{|i| i.value == 'other'}
      city_enum_ids['other'] = l.id.to_s if l != nil
      Group.find(:all, :conditions => {:location => true}).each do |city|
        l = city_enums.find{|i| i.name == city.name}
        city_enum_ids[city.name] = l.id.to_s if l != nil
      end

      organization_member_id = bag_property_ids["organization_member"]
      organization_member_enum_ids = {}
      organization_member_enum_ids["true"] = BagPropertyEnum.find(:first, :conditions => {:bag_property_id => organization_member_id, :value => 'yes'}).id
      organization_member_enum_ids["false"] = BagPropertyEnum.find(:first, :conditions => {:bag_property_id => organization_member_id, :value => 'no'}).id

      organization_status_id = bag_property_ids["organization_status"]
      organization_status_enum_ids = {}
      (1..6).each do |oid|
        organization_status_enum_ids[oid.to_s] = BagPropertyEnum.find(:first, :conditions => {:bag_property_id => organization_status_id, :value => oid.to_s}).id
      end

      why_joined_id = bag_property_ids["why_joined"]
      why_joined_enum_ids = {}
      (1..5).each do |eid|
        why_joined_enum_ids[eid] = BagPropertyEnum.find(:first, :conditions => {:bag_property_id => why_joined_id, :value => eid}).id
      end
    
      how_found_id = bag_property_ids["how_found"]
      how_found_enum_ids = {}
      (1..4).each do |eid|
        how_found_enum_ids[eid] = BagPropertyEnum.find(:first, :conditions => {:bag_property_id => how_found_id, :value => eid}).id
      end
    
#      User.find(:all).each do |user|
      User.find(:all, :conditions => {:login => 'joel'}).each do |user|
        
        puts "migrating: #{user.login}"

        if user.city != nil && !user.city.empty?
          bag_property_id = bag_property_ids["city"]
          BagPropertyValue.create(:data_type => BagProperty::DATA_TYPE_ENUM, :user_id => user.id, 
            :bag_property_id => bag_property_id, :bag_property_enum_id => city_enum_ids[user.city].to_i, 
            :visibility => BagProperty::VISIBILITY_USERS)
        end
      
        bag_property_id = bag_property_ids['organization_member']
        BagPropertyValue.create(:data_type => BagProperty::DATA_TYPE_ENUM, :user_id => user.id, 
          :bag_property_id => bag_property_id, :bag_property_enum_id => organization_member_enum_ids[user.organization_member.to_s], 
          :visibility => BagProperty::VISIBILITY_ADMIN)
            
        if user.organization != nil && !user.organization.empty?
          bag_property_id = bag_property_ids["organization"]
          BagPropertyValue.create(:data_type => BagProperty::DATA_TYPE_STRING, :user_id => user.id, 
            :bag_property_id => bag_property_id, :visibility => BagProperty::VISIBILITY_FRIENDS, 
            :svalue => user.organization)  
        end
        
        bag_property_id = bag_property_ids['organization_status']
        BagPropertyValue.create(:data_type => BagProperty::DATA_TYPE_ENUM, :user_id => user.id, 
          :bag_property_id => bag_property_id, :bag_property_enum_id => organization_status_enum_ids[user.organization_status.to_s], 
          :visibility => BagProperty::VISIBILITY_ADMIN)
            
        if user.website != nil && !user.website.empty?
          bag_property_id = bag_property_ids["organization_website"]
          BagPropertyValue.create(:data_type => BagProperty::DATA_TYPE_STRING, :user_id => user.id, 
            :bag_property_id => bag_property_id, :visibility => BagProperty::VISIBILITY_FRIENDS, 
            :svalue => user.organization_url)  
        end
        
        bag_property_id = bag_property_ids['why_joined']
        BagPropertyValue.create(:data_type => BagProperty::DATA_TYPE_ENUM, :user_id => user.id, 
          :bag_property_id => bag_property_id, :bag_property_enum_id => why_joined_enum_ids[user.why_joined], 
          :visibility => BagProperty::VISIBILITY_ADMIN)
          
        bag_property_id = bag_property_ids['how_found']
        BagPropertyValue.create(:data_type => BagProperty::DATA_TYPE_ENUM, :user_id => user.id, 
          :bag_property_id => bag_property_id, :bag_property_enum_id => how_found_enum_ids[user.how_found], 
          :visibility => BagProperty::VISIBILITY_ADMIN)
          
        if user.flickr != nil && !user.flickr.empty?
        bag_property_id = bag_property_ids["flickr"]
        BagPropertyValue.create(:data_type => BagProperty::DATA_TYPE_STRING, :user_id => user.id, 
          :bag_property_id => bag_property_id, :visibility => BagProperty::VISIBILITY_FRIENDS, 
          :svalue => user.flickr)  
        end
        
        if user.msn != nil && !user.msn.empty?
          bag_property_id = bag_property_ids["msn"]
          BagPropertyValue.create(:data_type => BagProperty::DATA_TYPE_STRING, :user_id => user.id, 
          :bag_property_id => bag_property_id, :visibility => BagProperty::VISIBILITY_FRIENDS, 
            :svalue => user.msn)
        end
      
        BagPropertyValue.create(:user_id => user.id, :bag_property_id => bag_property_ids['view_blog'], :visibility => BagProperty::VISIBILITY_USERS)
        BagPropertyValue.create(:user_id => user.id, :bag_property_id => bag_property_ids['view_photos'], :visibility => BagProperty::VISIBILITY_USERS)
        BagPropertyValue.create(:user_id => user.id, :bag_property_id => bag_property_ids['view_groups'], :visibility => BagProperty::VISIBILITY_USERS)
        BagPropertyValue.create(:user_id => user.id, :bag_property_id => bag_property_ids['view_colleagues'], :visibility => BagProperty::VISIBILITY_USERS)
        BagPropertyValue.create(:user_id => user.id, :bag_property_id => bag_property_ids['view_activities'], :visibility => BagProperty::VISIBILITY_USERS)
        BagPropertyValue.create(:user_id => user.id, :bag_property_id => bag_property_ids['direct_message'], :visibility => BagProperty::VISIBILITY_USERS)
        BagPropertyValue.create(:user_id => user.id, :bag_property_id => bag_property_ids['share_doc'], :visibility => BagProperty::VISIBILITY_USERS)

    end
  end
  end

  namespace :db do
    desc "Fix yfh profile"
    task :fix_yfh_profile => :environment do
      BagProperty.find(:first, :conditions => {:name => 'organization_member'}).update_attribute(:registration_page, nil)
      BagProperty.find(:first, :conditions => {:name => 'organization'}).update_attribute(:registration_page, nil)
      BagProperty.find(:first, :conditions => {:name => 'organization_status'}).update_attribute(:registration_page, nil)
      BagProperty.find(:first, :conditions => {:name => 'organization_website'}).update_attribute(:registration_page, nil)
#      BagProperty.create(
#        :name => 'about_me', 
#        :label => 'About Me', 
#        :default_visibility => BagProperty::VISIBILITY_EVERYONE,
#        :display_type => BagProperty::DISPLAY_TYPE_TEXT_AREA, 
#        :registration_page => 1,
#        :sort => 3 
#      )
    end
    puts "Done fixing yfh profile"
  end
  

    
end

