class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable   :validatable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable
  attr_accessible :email, :password, :password_confirmation
end
