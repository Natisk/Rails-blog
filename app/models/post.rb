class Post < ActiveRecord::Base
  attr_accessible :body, :data, :title, :tags_attributes, :status, :explanation, :user_id
  validates :title, :body, :presence => true  
  has_many :blog_comments, :dependent => :destroy
  scope :nothidden,             -> { where("title  NOT LIKE '%hidden%' ") }
  scope :unapproved,            -> { where(:status => false) }
  #scope :unapproved_post_lim,   -> { unapproved.where("posts_count < 3") }
  belongs_to :user
  has_many :post_tags
  has_many :tags, :through=>:post_tags
  accepts_nested_attributes_for :tags



end
