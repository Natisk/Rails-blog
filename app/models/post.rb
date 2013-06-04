class Post < ActiveRecord::Base
  attr_accessible :body, :data, :title, :tags_attributes
  validates :title, :body, :presence => true  
  has_many :comments, :dependent => :destroy
  scope :nothidden, -> { where("title  NOT LIKE '%hidden%' ") }
  belongs_to :user
  has_many :post_tags
  has_many :tags, :through=>:post_tags
  accepts_nested_attributes_for :tags
end
