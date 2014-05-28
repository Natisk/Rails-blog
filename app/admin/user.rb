ActiveAdmin.register User do

  filter :email

  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count
    column :username
    default_actions                   
  end

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
