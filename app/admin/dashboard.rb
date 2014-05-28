ActiveAdmin.register_page 'Dashboard' do

  menu :priority => 1, :label => proc{ I18n.t('active_admin.dashboard') }

  content :title => proc{ I18n.t('active_admin.dashboard') } do
    div :class => 'blank_slate_container', :id => 'dashboard_default_message' do
      span :class => 'blank_slate' do
        span I18n.t('active_admin.dashboard_welcome.welcome')
        small I18n.t('active_admin.dashboard_welcome.call_to_action')
      end
    end

    columns do
     column do
       panel 'Recent Posts' do
         ul do
           Post.limit(5).map do |post|
             li link_to(post.title, admin_post_path(post))
           end
         end
       end
     end
    end

    columns do
      column do
        panel 'Recent BlogComments' do
          ul do
            BlogComment.limit(5).map do |blog_comment|
              li link_to(blog_comment.body, admin_blog_comment_path(blog_comment))
            end
          end
        end
      end
    end

    columns do
      column do
        panel 'Recent Users' do
          ul do
            User.limit(5).map do |user|
              li link_to(user.email, edit_admin_user_path(user))
            end
          end
        end
      end
    end
  end # content

end
