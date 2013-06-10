ActiveAdmin.register User do
  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count
    column :username
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "User Details" do
      f.input :email
      f.input :username
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.actions                         
  end                                 
end                                   
