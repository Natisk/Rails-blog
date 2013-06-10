class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blog_comments, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me


end
