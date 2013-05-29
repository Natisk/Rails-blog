class Post < ActiveRecord::Base
  attr_accessible :body, :data, :title
  validates :title, :body, :presence => true  
  has_many :comments, :dependent => :destroy

  scope :nothidden, -> { where("title  NOT LIKE '%hidden%' ") }

end
