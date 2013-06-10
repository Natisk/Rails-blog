# == Schema Information
#
# Table name: blog_comments
#
#  id         :integer          not null, primary key
#  commenter  :string(255)
#  body       :text
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class BlogComment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :body, :user, :post_id, :user_id, :commenter
  validates :user, :post_id, :user_id, :body, :presence => true
  validates :body, :length => { :maximum => 1024 }
end

