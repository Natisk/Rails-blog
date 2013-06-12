Blog15min::Application.routes.draw do
  get "password_resets/new"

  root :to => 'posts#index'
  devise_for :users, :path_names=>{sign_up: 'register'}
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)



  resources :posts do
    resources :blog_comments
  end

  resources :tags


  #resources :blog_comments


  #resources :posts


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :blog_comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :blog_comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'posts#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
#== Route Map
# Generated on 10 Jun 2013 17:34
#
#                 new_user_session GET        /users/sign_in(.:format)                         devise/sessions#new
#                     user_session POST       /users/sign_in(.:format)                         devise/sessions#create
#             destroy_user_session DELETE     /users/sign_out(.:format)                        devise/sessions#destroy
#                    user_password POST       /users/password(.:format)                        devise/passwords#create
#                new_user_password GET        /users/password/new(.:format)                    devise/passwords#new
#               edit_user_password GET        /users/password/edit(.:format)                   devise/passwords#edit
#                                  PUT        /users/password(.:format)                        devise/passwords#update
#         cancel_user_registration GET        /users/cancel(.:format)                          devise/registrations#cancel
#                user_registration POST       /users(.:format)                                 devise/registrations#create
#            new_user_registration GET        /users/register(.:format)                        devise/registrations#new
#           edit_user_registration GET        /users/edit(.:format)                            devise/registrations#edit
#                                  PUT        /users(.:format)                                 devise/registrations#update
#                                  DELETE     /users(.:format)                                 devise/registrations#destroy
#                       admin_root            /admin(.:format)                                 admin/posts#index
#                             root            /                                                posts#index
#          batch_action_admin_tags POST       /admin/tags/batch_action(.:format)               admin/tags#batch_action
#                       admin_tags GET        /admin/tags(.:format)                            admin/tags#index
#                                  POST       /admin/tags(.:format)                            admin/tags#create
#                    new_admin_tag GET        /admin/tags/new(.:format)                        admin/tags#new
#                   edit_admin_tag GET        /admin/tags/:id/edit(.:format)                   admin/tags#edit
#                        admin_tag GET        /admin/tags/:id(.:format)                        admin/tags#show
#                                  PUT        /admin/tags/:id(.:format)                        admin/tags#update
#                                  DELETE     /admin/tags/:id(.:format)                        admin/tags#destroy
# batch_action_admin_blog_comments POST       /admin/blog_comments/batch_action(.:format)      admin/blog_comments#batch_action
#              admin_blog_comments GET        /admin/blog_comments(.:format)                   admin/blog_comments#index
#                                  POST       /admin/blog_comments(.:format)                   admin/blog_comments#create
#           new_admin_blog_comment GET        /admin/blog_comments/new(.:format)               admin/blog_comments#new
#          edit_admin_blog_comment GET        /admin/blog_comments/:id/edit(.:format)          admin/blog_comments#edit
#               admin_blog_comment GET        /admin/blog_comments/:id(.:format)               admin/blog_comments#show
#                                  PUT        /admin/blog_comments/:id(.:format)               admin/blog_comments#update
#                                  DELETE     /admin/blog_comments/:id(.:format)               admin/blog_comments#destroy
#         batch_action_admin_users POST       /admin/users/batch_action(.:format)              admin/users#batch_action
#                      admin_users GET        /admin/users(.:format)                           admin/users#index
#                                  POST       /admin/users(.:format)                           admin/users#create
#                   new_admin_user GET        /admin/users/new(.:format)                       admin/users#new
#                  edit_admin_user GET        /admin/users/:id/edit(.:format)                  admin/users#edit
#                       admin_user GET        /admin/users/:id(.:format)                       admin/users#show
#                                  PUT        /admin/users/:id(.:format)                       admin/users#update
#                                  DELETE     /admin/users/:id(.:format)                       admin/users#destroy
#   batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)        admin/admin_users#batch_action
#                admin_admin_users GET        /admin/admin_users(.:format)                     admin/admin_users#index
#                                  POST       /admin/admin_users(.:format)                     admin/admin_users#create
#             new_admin_admin_user GET        /admin/admin_users/new(.:format)                 admin/admin_users#new
#            edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)            admin/admin_users#edit
#                 admin_admin_user GET        /admin/admin_users/:id(.:format)                 admin/admin_users#show
#                                  PUT        /admin/admin_users/:id(.:format)                 admin/admin_users#update
#                                  DELETE     /admin/admin_users/:id(.:format)                 admin/admin_users#destroy
#                  admin_dashboard            /admin/dashboard(.:format)                       admin/dashboard#index
#         batch_action_admin_posts POST       /admin/posts/batch_action(.:format)              admin/posts#batch_action
#                      admin_posts GET        /admin/posts(.:format)                           admin/posts#index
#                                  POST       /admin/posts(.:format)                           admin/posts#create
#                   new_admin_post GET        /admin/posts/new(.:format)                       admin/posts#new
#                  edit_admin_post GET        /admin/posts/:id/edit(.:format)                  admin/posts#edit
#                       admin_post GET        /admin/posts/:id(.:format)                       admin/posts#show
#                                  PUT        /admin/posts/:id(.:format)                       admin/posts#update
#                                  DELETE     /admin/posts/:id(.:format)                       admin/posts#destroy
#      batch_action_admin_comments POST       /admin/comments/batch_action(.:format)           admin/comments#batch_action
#                   admin_comments GET        /admin/comments(.:format)                        admin/comments#index
#                                  POST       /admin/comments(.:format)                        admin/comments#create
#                    admin_comment GET        /admin/comments/:id(.:format)                    admin/comments#show
#            batch_action_comments POST       /comments/batch_action(.:format)                 comments#batch_action
#                         comments GET        /comments(.:format)                              comments#index
#                                  POST       /comments(.:format)                              comments#create
#                          comment GET        /comments/:id(.:format)                          comments#show
#           new_admin_user_session GET        /admin/login(.:format)                           active_admin/devise/sessions#new
#               admin_user_session POST       /admin/login(.:format)                           active_admin/devise/sessions#create
#       destroy_admin_user_session DELETE|GET /admin/logout(.:format)                          active_admin/devise/sessions#destroy
#              admin_user_password POST       /admin/password(.:format)                        active_admin/devise/passwords#create
#          new_admin_user_password GET        /admin/password/new(.:format)                    active_admin/devise/passwords#new
#         edit_admin_user_password GET        /admin/password/edit(.:format)                   active_admin/devise/passwords#edit
#                                  PUT        /admin/password(.:format)                        active_admin/devise/passwords#update
#                       admin_root            /admin(.:format)                                 admin/posts#index
#                             root            /                                                posts#index
#                                  POST       /admin/tags/batch_action(.:format)               admin/tags#batch_action
#                                  GET        /admin/tags(.:format)                            admin/tags#index
#                                  POST       /admin/tags(.:format)                            admin/tags#create
#                                  GET        /admin/tags/new(.:format)                        admin/tags#new
#                                  GET        /admin/tags/:id/edit(.:format)                   admin/tags#edit
#                                  GET        /admin/tags/:id(.:format)                        admin/tags#show
#                                  PUT        /admin/tags/:id(.:format)                        admin/tags#update
#                                  DELETE     /admin/tags/:id(.:format)                        admin/tags#destroy
#                                  POST       /admin/blog_comments/batch_action(.:format)      admin/blog_comments#batch_action
#                                  GET        /admin/blog_comments(.:format)                   admin/blog_comments#index
#                                  POST       /admin/blog_comments(.:format)                   admin/blog_comments#create
#                                  GET        /admin/blog_comments/new(.:format)               admin/blog_comments#new
#                                  GET        /admin/blog_comments/:id/edit(.:format)          admin/blog_comments#edit
#                                  GET        /admin/blog_comments/:id(.:format)               admin/blog_comments#show
#                                  PUT        /admin/blog_comments/:id(.:format)               admin/blog_comments#update
#                                  DELETE     /admin/blog_comments/:id(.:format)               admin/blog_comments#destroy
#                                  POST       /admin/users/batch_action(.:format)              admin/users#batch_action
#                                  GET        /admin/users(.:format)                           admin/users#index
#                                  POST       /admin/users(.:format)                           admin/users#create
#                                  GET        /admin/users/new(.:format)                       admin/users#new
#                                  GET        /admin/users/:id/edit(.:format)                  admin/users#edit
#                                  GET        /admin/users/:id(.:format)                       admin/users#show
#                                  PUT        /admin/users/:id(.:format)                       admin/users#update
#                                  DELETE     /admin/users/:id(.:format)                       admin/users#destroy
#                                  POST       /admin/admin_users/batch_action(.:format)        admin/admin_users#batch_action
#                                  GET        /admin/admin_users(.:format)                     admin/admin_users#index
#                                  POST       /admin/admin_users(.:format)                     admin/admin_users#create
#                                  GET        /admin/admin_users/new(.:format)                 admin/admin_users#new
#                                  GET        /admin/admin_users/:id/edit(.:format)            admin/admin_users#edit
#                                  GET        /admin/admin_users/:id(.:format)                 admin/admin_users#show
#                                  PUT        /admin/admin_users/:id(.:format)                 admin/admin_users#update
#                                  DELETE     /admin/admin_users/:id(.:format)                 admin/admin_users#destroy
#                                             /admin/dashboard(.:format)                       admin/dashboard#index
#                                  POST       /admin/posts/batch_action(.:format)              admin/posts#batch_action
#                                  GET        /admin/posts(.:format)                           admin/posts#index
#                                  POST       /admin/posts(.:format)                           admin/posts#create
#                                  GET        /admin/posts/new(.:format)                       admin/posts#new
#                                  GET        /admin/posts/:id/edit(.:format)                  admin/posts#edit
#                                  GET        /admin/posts/:id(.:format)                       admin/posts#show
#                                  PUT        /admin/posts/:id(.:format)                       admin/posts#update
#                                  DELETE     /admin/posts/:id(.:format)                       admin/posts#destroy
#                                  POST       /admin/comments/batch_action(.:format)           admin/comments#batch_action
#                                  GET        /admin/comments(.:format)                        admin/comments#index
#                                  POST       /admin/comments(.:format)                        admin/comments#create
#                                  GET        /admin/comments/:id(.:format)                    admin/comments#show
#                                  POST       /comments/batch_action(.:format)                 comments#batch_action
#                                  GET        /comments(.:format)                              comments#index
#                                  POST       /comments(.:format)                              comments#create
#                                  GET        /comments/:id(.:format)                          comments#show
#               post_blog_comments GET        /posts/:post_id/blog_comments(.:format)          blog_comments#index
#                                  POST       /posts/:post_id/blog_comments(.:format)          blog_comments#create
#            new_post_blog_comment GET        /posts/:post_id/blog_comments/new(.:format)      blog_comments#new
#           edit_post_blog_comment GET        /posts/:post_id/blog_comments/:id/edit(.:format) blog_comments#edit
#                post_blog_comment GET        /posts/:post_id/blog_comments/:id(.:format)      blog_comments#show
#                                  PUT        /posts/:post_id/blog_comments/:id(.:format)      blog_comments#update
#                                  DELETE     /posts/:post_id/blog_comments/:id(.:format)      blog_comments#destroy
#                            posts GET        /posts(.:format)                                 posts#index
#                                  POST       /posts(.:format)                                 posts#create
#                         new_post GET        /posts/new(.:format)                             posts#new
#                        edit_post GET        /posts/:id/edit(.:format)                        posts#edit
#                             post GET        /posts/:id(.:format)                             posts#show
#                                  PUT        /posts/:id(.:format)                             posts#update
#                                  DELETE     /posts/:id(.:format)                             posts#destroy
#                             tags GET        /tags(.:format)                                  tags#index
#                                  POST       /tags(.:format)                                  tags#create
#                          new_tag GET        /tags/new(.:format)                              tags#new
#                         edit_tag GET        /tags/:id/edit(.:format)                         tags#edit
#                              tag GET        /tags/:id(.:format)                              tags#show
#                                  PUT        /tags/:id(.:format)                              tags#update
#                                  DELETE     /tags/:id(.:format)                              tags#destroy
#                             root            /                                                posts#index
