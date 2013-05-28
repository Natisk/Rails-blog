class Post < ActiveRecord::Base
  attr_accessible :body, :data, :title
  validates :title, :body, :presence => true  
  has_many :comments

  scope :nothidden, -> { where("title  NOT LIKE '%hidden%' ") }

end
